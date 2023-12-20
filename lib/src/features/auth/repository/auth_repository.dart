import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sih23/src/core/constants/app_constants.dart';
import 'package:sih23/src/core/constants/firebase_constants.dart';
import 'package:sih23/src/core/failure.dart';
import 'package:sih23/src/core/provider/firebase_provider.dart';
import 'package:sih23/src/core/typedef.dart';
import 'package:sih23/src/model/user_model.dart';
import 'package:sih23/src/model/wool_model.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    auth: ref.read(authProvider),
    firestore: ref.read(firestoreProvider),
  ),
);

final verificationIdProvider = StateProvider<String?>((ref) => null);

final getWoolsDataProvider = StreamProvider<List<WoolModel>>((ref) {
  final authRepo = ref.read(authRepositoryProvider);

  return authRepo.getAllWoolsData();
});

class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  AuthRepository({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
  })  : _auth = auth,
        _firestore = firestore;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  FutureEither<UserModel> registerWithEmail({
    required String username,
    required String email,
    required String password,
    required String phone,
    required String userType,
  }) async {
    try {
      UserCredential userCredential;
      UserModel newUserModel;

      userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      newUserModel = UserModel(
        name: userCredential.user!.displayName ?? username,
        phoneNumber: userCredential.user!.phoneNumber ?? phone,
        email: userCredential.user!.email ?? email,
        userType: userType,
        profilePicture:
            userCredential.user!.photoURL ?? AppConstants.avatarDefault,
        uid: userCredential.user!.uid,
        isVerified: false,
        isRegistered: false,
        isAppliedForAssurance: false,
      );

      _firestore
          .collection(FirebaseConstants.usersCollection)
          .doc(userCredential.user!.uid)
          .set(newUserModel.toMap());
      _isLoggedIn = true;
      return right(newUserModel);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _isLoggedIn = true;
    } on FirebaseException catch (e) {
      throw e.message!;
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      _isLoggedIn = false;
    } on FirebaseException catch (e) {
      throw e.message!;
    }
  }

  Stream<UserModel> getUserData(String uid) {
    return _users.doc(uid).snapshots().map(
          (event) => UserModel.fromMap(
            event.data() as Map<String, dynamic>,
          ),
        );
  }

  CollectionReference get _wools =>
      _firestore.collection(FirebaseConstants.woolCollection);

  Stream<List<WoolModel>> getAllWoolsData() {
    return _wools.snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) =>
                  WoolModel.fromMap(doc.data() as Map<String, dynamic>))
              .toList(),
        );
  }

  FutureEither<void> createAndSaveWool({
    required String woolId,
    required String color,
    required bool isRejected,
  }) async {
    try {
      WoolModel wool =
          WoolModel(id: woolId, color: color, isRejected: isRejected);
      await _wools.doc(woolId).set(wool.toMap());
      return right(unit);
    } on FirebaseException catch (e) {
      print("Firebase Exception: ${e.message}");
      return left(Failure(e.message!));
    } catch (e) {
      print("Error: $e");
      return left(Failure(e.toString()));
    }
  }

  Future<void> updateWoolStatus(String woolId, bool isRejected) async {
    try {
      await _wools.doc(woolId).update({'isRejected': isRejected});
    } on FirebaseException catch (e) {
      print("Firebase Exception: ${e.message}");
      throw Failure(e.message!);
    } catch (e) {
      print("Error: $e");
      throw Failure(e.toString());
    }
  }
}

// ignore_for_file: unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sih23/src/core/failure.dart';
import 'package:sih23/src/core/provider/firebase_provider.dart';
import 'package:sih23/src/core/typedef.dart';
import 'package:sih23/src/model/user_model.dart';

import '../../../../core/constants/firebase_constants.dart';

final userProfileRepositoryProvider = Provider(
  (ref) => UserProfileRepository(
    firestore: ref.watch(firestoreProvider),
  ),
);

class UserProfileRepository {
  final FirebaseFirestore _firestore;

  UserProfileRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  //! Edit user
  FutureVoid editUserProfile(UserModel user) async {
    try {
      return right(_users.doc(user.uid).update(user.toMap()));
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}

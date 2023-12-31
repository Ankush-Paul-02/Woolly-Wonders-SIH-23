// ignore_for_file: unused_element

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sih23/src/core/failure.dart';
import 'package:sih23/src/core/provider/firebase_provider.dart';
import 'package:sih23/src/core/typedef.dart';

import '../../../../core/constants/firebase_constants.dart';
import '../../../../model/wool_model.dart';

final userProfileRepositoryProvider = Provider(
  (ref) => UserProfileRepository(
    firestore: ref.watch(firestoreProvider),
    storage: ref.watch(storageProvider),
  ),
);

class UserProfileRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  UserProfileRepository({
    required FirebaseFirestore firestore,
    required FirebaseStorage storage,
  })  : _firestore = firestore,
        _storage = storage;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  FutureEither uploadImage(String userId, XFile? imageFile) async {
    try {
      if (imageFile == null) {
        return left(Failure('No image selected'));
      }

      // Convert XFile to File
      File file = File(imageFile.path);

      // Generate a unique filename for the image
      final String fileName =
          '$userId/${DateTime.now().millisecondsSinceEpoch}.jpg';

      // Upload the image to Firebase Storage with a folder structure
      final Reference storageReference =
          _storage.ref().child('images/$fileName');
      await storageReference.putFile(file);

      // Get the download URL of the uploaded image
      final String downloadUrl = await storageReference.getDownloadURL();

      // Update the user's profile picture URL in Firestore
      await _users.doc(userId).update({'profilePicture': downloadUrl});

      // Return the download URL on success
      return right(downloadUrl);
    } catch (e) {
      return left(
        Failure('Failed to upload image: $e'),
      ); // Return a failure on error
    }
  }

  FutureEither register(String userId) async {
    try {
      await _users.doc(userId).update({'isRegistered': true});
      return right('Successfully updated');
    } catch (e) {
      return left(
        Failure('Failed to upload: $e'),
      );
    }
  }

  FutureEither applyForQualityAssurance(String userId) async {
    try {
      await _users.doc(userId).update({'isAppliedForAssurance': true});
      return right('Successfully applied');
    } catch (e) {
      return left(
        Failure('Failed to applied: $e'),
      );
    }
  }

  Future<Either<Failure, String>> addWoolProduct(
      String uid, WoolModel woolProduct) async {
    try {
      final Map<String, dynamic> woolData = woolProduct.toMap();

      // Use add method to create a new document with a unique ID
      await _firestore.collection('woolProducts').add(woolData);

      return right('Wool product added successfully');
    } catch (e) {
      return left(Failure("Failed to add wool product: $e"));
    }
  }

  FutureEither<List<WoolModel>> getAllWoolProducts() async {
    try {
      final QuerySnapshot woolProductsSnapshot =
          await _firestore.collection('woolProducts').get();

      final List<WoolModel> woolProducts = woolProductsSnapshot.docs
          .map((doc) => WoolModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return right(woolProducts);
    } catch (e) {
      return left(Failure('Failed to get all wool products: $e'));
    }
  }
}

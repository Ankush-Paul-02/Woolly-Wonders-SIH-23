// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sih23/src/features/home/user/repository/user_profile_repository.dart';
import 'package:sih23/src/model/user_model.dart';

import '../../../../core/provider/storage_repository_provider.dart';
import '../../../../model/wool_model.dart';

final imagePickerProvider = Provider<ImagePicker>((ref) => ImagePicker());

final userProfileControllerProvider =
    StateNotifierProvider<UserProfileController, bool>((ref) {
  final userProfileRepository = ref.watch(userProfileRepositoryProvider);
  final storageRepository = ref.watch(storageRepositoryProvider);
  final imagePicker = ref.watch(imagePickerProvider);
  return UserProfileController(
    userProfileRepository: userProfileRepository,
    storageRepository: storageRepository,
    imagePicker: imagePicker,
    ref: ref,
  );
});

class UserProfileController extends StateNotifier<bool> {
  final UserProfileRepository _userProfileRepository;
  final ImagePicker _imagePicker;

  UserProfileController({
    required UserProfileRepository userProfileRepository,
    required StorageRepository storageRepository,
    required Ref ref,
    required ImagePicker imagePicker,
  })  : _userProfileRepository = userProfileRepository,
        _imagePicker = imagePicker,
        super(false);

  Future<void> uploadProfilePicture(String userId) async {
    try {
      // Open the image picker
      final XFile? imageFile =
          await _imagePicker.pickImage(source: ImageSource.gallery);

      if (imageFile != null) {
        state = true;
        final result =
            await _userProfileRepository.uploadImage(userId, imageFile);

        result.fold(
          (failure) {
            return left(failure.message);
          },
          (downloadUrl) {
            return left(downloadUrl);
          },
        );
        state = false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> register(String uid) async {
    await _userProfileRepository.register(uid);
    print('register');
  }

  Future<void> qualityForAssurance(String uid) async {
    await _userProfileRepository.applyForQualityAssurance(uid);
    print('applied');
  }

  Future<void> addWoolProduct({
    required String uid,
    required WoolModel woolProduct,
  }) async {
    try {
      state = true;
      final result =
          await _userProfileRepository.addWoolProduct(uid, woolProduct);

      result.fold(
        (failure) {
          print('Error adding wool product: ${failure.message}');
          // Handle the error as needed
        },
        (successMessage) {
          print(successMessage);
          // Handle success (e.g., show a success message)
        },
      );
      state = false;
    } catch (e) {
      print('Error adding wool product: $e');
    }
  }

  Future<List<UserModel>> getUsersByType(String userType) async {
    try {
      final QuerySnapshot usersSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('userType', isEqualTo: userType)
          .get();

      final List<UserModel> users = usersSnapshot.docs
          .map((doc) => UserModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return users;
    } catch (e) {
      // Handle the error as needed
      print('Error fetching users: $e');
      return [];
    }
  }

  
  Future<List<WoolModel>> getAllWoolProducts() async {
    try {
      final result = await _userProfileRepository.getAllWoolProducts();
      
      return result.fold(
        (failure) {
          print('Failed to get wool products: ${failure.message}');
          return []; // or throw an error if needed
        },
        (woolProducts) => woolProducts,
      );
    } catch (e) {
      print('Error getting wool products: $e');
      return []; // or throw an error if needed
    }
  }
}

// ignore_for_file: avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sih23/src/features/home/user/repository/user_profile_repository.dart';

import '../../../../core/provider/storage_repository_provider.dart';

final imagePickerProvider = Provider<ImagePicker>((ref) => ImagePicker());

final userProfileControllerProvider =
    StateNotifierProvider<UserProfileController, bool>((ref) {
  final userProfileRepository = ref.watch(userProfileRepositoryProvider);
  final storageRepository = ref.watch(storageRepositoryProvider);
  final imagePicker = ref.watch(imagePickerProvider);
  return UserProfileController(
    ref: ref,
    storageRepository: storageRepository,
    userProfileRepository: userProfileRepository,
    imagePicker: imagePicker,
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
}

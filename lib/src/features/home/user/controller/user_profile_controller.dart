import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih23/src/core/provider/storage_repository_provider.dart';
import 'package:sih23/src/core/utils.dart';
import 'package:sih23/src/features/auth/controllers/auth_controller.dart';
import 'package:sih23/src/features/home/user/repository/user_profile_repository.dart';
import 'package:sih23/src/model/user_model.dart';


final userProfileControllerProvider =
    StateNotifierProvider<UserProfileController, bool>((ref) {
  final userProfileRepository = ref.watch(userProfileRepositoryProvider);
  final storageRepository = ref.watch(storageRepositoryProvider);
  return UserProfileController(
    ref: ref,
    storageRepository: storageRepository,
    userProfileRepository: userProfileRepository,
  );
});

class UserProfileController extends StateNotifier<bool> {
  final UserProfileRepository _userProfileRepository;
  final Ref _ref;
  final StorageRepository _storageRepository;
  UserProfileController({
    required UserProfileRepository userProfileRepository,
    required Ref ref,
    required StorageRepository storageRepository,
  })  : _userProfileRepository = userProfileRepository,
        _ref = ref,
        _storageRepository = storageRepository,
        super(false);

  //! Edit user profile
  void editUserProfile({
    required File? profileFile,
    required BuildContext context,
    required String name,
    required String phone,
    required String aadhar,
  }) async {
    state = true;
    UserModel user = _ref.read(userProvider)!;

    if (profileFile != null) {
      final res = await _storageRepository.storeFile(
        path: 'users/profile',
        id: user.uid,
        file: profileFile,
      );
      res.fold(
        (l) => showSnackBar(context, l.message),
        (r) => user = user.copyWith(profilePicture: r),
      );
    }

    user = user.copyWith(
      aadharNumber: aadhar,
      name: name,
      phoneNumber: phone,
    );

    final res = await _userProfileRepository.editUserProfile(user);
    
    state = false;
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        _ref.read(userProvider.notifier).update((state) => user);
        Navigator.of(context).pop();
      },
    );
  }
}

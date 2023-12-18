// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih23/src/features/auth/auth_pref.dart';
import 'package:sih23/src/features/auth/repository/auth_repository.dart';
import 'package:sih23/src/routes/app_routes.dart';

import '../../../core/utils.dart';
import '../../../model/user_model.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) => AuthController(
    authRepository: ref.watch(authRepositoryProvider),
    ref: ref,
  ),
);

final authStateChangeProvider = StreamProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.authStateChange;
});

final getUserDataProvider = StreamProvider.family((ref, String uid) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserData(uid);
});

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  final Ref _ref;
  AuthController({
    required AuthRepository authRepository,
    required Ref ref,
  })  : _authRepository = authRepository,
        _ref = ref,
        super(false);

  Stream<User?> get authStateChange => _authRepository.authStateChanges;

  void registerWithEmail({
    required String username,
    required String email,
    required String password,
    required String phone,
    required String aadhar,
    required BuildContext context,
  }) async {
    state = true;
    final user = await _authRepository.registerWithEmail(
      username: username,
      email: email,
      password: password,
      phone: phone,
      aadhar: aadhar,
    );
    state = false;
    user.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        _ref.read(userProvider.notifier).update((state) => r);
        Navigator.pushNamed(
          context,
          AppRoute.loginRoute,
        );
      },
    );
  }

  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    await _authRepository.login(email: email, password: password);
    await setLoggedIn(true);
    Navigator.pushNamed(
      context,
      AppRoute.homeRoute,
    );
    state = false;
  }

  void logout(BuildContext context) async {
    state = true;
    await _authRepository.logout();
    await setLoggedIn(false);
    Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoute.loginRoute, (Route<dynamic> route) => false);
    state = false;
  }

  Stream<UserModel> getUserData(String uid) {
    return _authRepository.getUserData(uid);
  }


}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih23/src/core/common/error_text.dart';
import 'package:sih23/src/core/common/loader.dart';
import 'package:sih23/src/features/home/test/screens/test_modules.dart';
import 'package:sih23/src/routes/app_routes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../auth/controllers/auth_controller.dart';

class TestScreen extends ConsumerWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangeProvider);

    return Scaffold(
      body: authState.when(
        data: (user) {
          if (user != null) {
            return const TestModule();
          } else {
            return _buildLoginButton(context);
          }
        },
        loading: () => const Loader(),
        error: (error, stackTrace) => ErrorText(error: error.toString()),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoute.loginRoute);
      },
      child: 'Login'.text.size(22).make(),
    ).centered();
  }
}

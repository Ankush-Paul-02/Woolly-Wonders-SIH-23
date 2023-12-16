import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih23/src/features/auth/controllers/auth_controller.dart';
import 'package:sih23/src/features/auth/screens/widgets/auth_field.dart';
import 'package:sih23/src/routes/app_routes.dart';
import 'package:sih23/src/theme/theme.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/common/loader.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void login(BuildContext context, WidgetRef ref) {
    ref.read(authControllerProvider.notifier).login(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      backgroundColor: AppTheme.whiteColor,
      body: isLoading
          ? const Loader()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                'Login'.text.size(34).bold.black.make(),
                'Please sign in to continue'
                    .text
                    .size(20)
                    .bold
                    .color(AppTheme.greyColor)
                    .make(),
                50.heightBox,
                AuthField(
                  label: 'Email',
                  hint: 'Enter your email',
                  icon: Icons.email,
                  controller: _emailController,
                  inputType: TextInputType.emailAddress,
                ),
                20.heightBox,
                AuthField(
                  label: 'Password',
                  hint: 'Enter your password',
                  icon: Icons.lock,
                  controller: _passwordController,
                  inputType: TextInputType.visiblePassword,
                  isObscure: true,
                ),
                40.heightBox,
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 30.w,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () => login(context, ref),
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: AppTheme.blueColor,
                      ),
                      label: 'Login'
                          .text
                          .size(18)
                          .bold
                          .color(AppTheme.whiteColor)
                          .make(),
                    ),
                  ),
                ),
                40.heightBox,
                // 'Already have an account? Sign in'.text.make().centered(),
                Text.rich(
                  TextSpan(
                    text: 'Don\'t have an account? ',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.pushNamed(
                                context,
                                AppRoute.registerRoute,
                              ),
                        style: TextStyle(
                          color: AppTheme.blueColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ).centered(),
              ],
            ).p20(),
    );
  }
}

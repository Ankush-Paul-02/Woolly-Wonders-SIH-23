import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih23/src/core/common/loader.dart';
import 'package:sih23/src/core/utils.dart';
import 'package:sih23/src/features/auth/controllers/auth_controller.dart';
import 'package:sih23/src/features/auth/screens/widgets/auth_field.dart';
import 'package:sih23/src/routes/app_routes.dart';
import 'package:sih23/src/theme/theme.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  void registerWithEmail(WidgetRef ref, BuildContext context, String userType) {
    ref.read(authControllerProvider.notifier).registerWithEmail(
      username: _nameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      phone: _phoneController.text.trim(),
      userType: userType, 
      context: context,
    );
  }

  bool isValidate() {
    if (_nameController.text.trim().isEmpty ||
        _phoneController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty ||
        _confirmPasswordController.text.trim().isEmpty) {
      showSnackBar(context, 'Please enter all fields!');
      return false;
    } else if (_passwordController.text.trim() !=
        _confirmPasswordController.text.trim()) {
      showSnackBar(context, 'Passwords doesn\'t match!');
      return false;
    }
    return true;
  }

  String _selectedUserType = 'Farmer'; 

  final List<String> userTypes = ['Farmer', 'Shader', 'Spinner', 'EndUser'];

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppTheme.whiteColor,
      body: isLoading
          ? const Loader()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  'Create Account'.text.size(34).bold.black.make(),
                  50.heightBox,
                  AuthField(
                    label: 'Name',
                    hint: 'Enter your name',
                    icon: Icons.person,
                    controller: _nameController,
                    inputType: TextInputType.name,
                  ),
                  20.heightBox,
                  DropdownButton<String>(
                    value: _selectedUserType,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedUserType = value!;
                      });
                    },
                    items: userTypes.map((String userType) {
                      return DropdownMenuItem<String>(
                        value: userType,
                        child: Text(userType),
                      );
                    }).toList(),
                  ),
                  20.heightBox,
                  AuthField(
                    label: 'Phone number',
                    hint: 'Enter your phone number',
                    icon: Icons.phone,
                    controller: _phoneController,
                    inputType: TextInputType.phone,
                  ),
                  20.heightBox,
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
                  20.heightBox,
                  AuthField(
                    label: 'Confirm Password',
                    hint: 'Enter password again',
                    icon: Icons.lock,
                    controller: _confirmPasswordController,
                    inputType: TextInputType.visiblePassword,
                    isObscure: true,
                  ),
                  40.heightBox,
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 35.w,
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (isValidate()) {
                            registerWithEmail(ref, context, _selectedUserType);
                          }
                        },
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
                        label: 'Sign Up'
                            .text
                            .size(18)
                            .bold
                            .color(AppTheme.whiteColor)
                            .make(),
                      ),
                    ),
                  ),
                  40.heightBox,
                  Text.rich(
                    TextSpan(
                      text: 'Already have an account? ',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign in',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.pushNamed(
                                  context,
                                  AppRoute.loginRoute,
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
            ),
    );
  }
}

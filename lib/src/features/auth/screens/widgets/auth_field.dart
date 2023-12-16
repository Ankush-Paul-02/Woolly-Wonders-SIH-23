import 'package:flutter/material.dart';

import '../../../../theme/theme.dart';

class AuthField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool? isObscure;
  final bool? isLabelShow;

  const AuthField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.controller,
    required this.inputType,
    this.isObscure,
    this.isLabelShow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        obscureText: isObscure ?? false,
        maxLines: 1,
        decoration: InputDecoration(
          filled: true,
          alignLabelWithHint: true,
          hintText: hint,
          fillColor: Colors.white,
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.black54,
            fontSize: 18,
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppTheme.blueColor,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(18),
          errorMaxLines: 1,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void showOTPDialog({
  required BuildContext context,
  required TextEditingController codeController,
  required VoidCallback onPressed,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: 'Enter OTP'.text.make(),
      content: Column(
        children: [
          TextField(
            controller: codeController,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: 'Done'.text.make(),
        ),
      ],
    ),
    barrierDismissible: false,
  );
}

import 'package:flutter/material.dart';
import 'package:sih23/src/theme/theme.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomDrawerPlate extends StatelessWidget {
  final String title;
  final Function onTap;
  final Color? backgroundColor;

  const CustomDrawerPlate({
    Key? key,
    required this.title,
    required this.onTap,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppTheme.blueColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
        ),
        onPressed: () => onTap(),
        child: title.text.size(18).white.bold.make().centered(),
      ).box.size(65.w, 50).make(),
    );
  }
}

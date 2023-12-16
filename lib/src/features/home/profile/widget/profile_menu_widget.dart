import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sih23/src/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileMenuWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppTheme.greyColor.withOpacity(0.2),
        ),
        child: Icon(icon),
      ),
      title: title.text.color(textColor).make(),
      trailing: endIcon ? Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppTheme.greyColor.withOpacity(0.2),
        ),
        child: const Icon(CupertinoIcons.forward).centered(),
      ) : null,
    );
  }
}
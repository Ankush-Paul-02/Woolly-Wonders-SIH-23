import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih23/src/features/auth/controllers/auth_controller.dart';
import 'package:sih23/src/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/common/error_text.dart';
import '../../../../../core/common/loader.dart';
import '../../../../../routes/app_routes.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  final String uid;
  const ProfileScreen({
    super.key,
    required this.uid,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  void logout(WidgetRef ref, BuildContext context) {
    ref.read(authControllerProvider.notifier).logout(context);
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(getUserDataProvider(widget.uid));
    return Scaffold(
      appBar: AppBar(
        title: 'Profile'.text.bold.size(22).make(),
      ),
      body: user.when(
        data: (userData) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            20.heightBox,
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.blueColor,
                    border: Border.all(
                      color: Colors.white,
                      width: 3.0,
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        userData.profilePicture,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.camera,
                    color: Colors.black,
                    size: 25,
                  ),
                ).onTap(
                  () => Navigator.pushNamed(
                    context,
                    AppRoute.editProfileRoute,
                    arguments: {'uid': widget.uid},
                  ),
                ),
              ],
            ).centered(),
            20.heightBox,
            userData.name.text.size(24).bold.make(),
            10.heightBox,
            userData.email.text
                .color(AppTheme.greyColor)
                .size(18)
                .normal
                .make(),
            20.heightBox,
            const Divider(),
            10.heightBox,
            'Aadhar ${userData.aadharNumber}'
                .text
                .color(AppTheme.greyColor)
                .size(18)
                .make(),
            10.heightBox,
            'Phone ${userData.phoneNumber}'
                .text
                .color(AppTheme.greyColor)
                .size(18)
                .make(),
            20.heightBox,
            const Divider(),
            10.heightBox,
            ElevatedButton(
              onPressed: () => logout(ref, context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.redColor,
              ),
              child: 'Logout'.text.white.bold.size(20).make(),
            ).box.size(double.infinity, 55).make(),
          ],
        ).pSymmetric(h: 20, v: 10),
        error: (error, printStackTrace) => ErrorText(error: error.toString()),
        loading: () => const Loader(),
      ),
    );
  }
}

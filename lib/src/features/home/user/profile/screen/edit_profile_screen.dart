import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih23/src/features/auth/controllers/auth_controller.dart';
import 'package:sih23/src/features/home/user/controller/user_profile_controller.dart';
import 'package:sih23/src/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../core/common/error_text.dart';
import '../../../../../core/common/loader.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  final String uid;
  const EditProfileScreen({
    super.key,
    required this.uid,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<EditProfileScreen> {
  void logout(WidgetRef ref, BuildContext context) {
    ref.read(authControllerProvider.notifier).logout(context);
  }

  void openImagePicker(WidgetRef ref) async {
    // Access the UserProfileController from the provider
    final userProfileController =
        ref.read(userProfileControllerProvider.notifier);

    // Call the uploadProfilePicture method
    await userProfileController.uploadProfilePicture(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(getUserDataProvider(widget.uid));
    return Scaffold(
      appBar: AppBar(
        title: 'Edit Profile'.text.bold.size(22).make(),
      ),
      body: user.when(
        data: (userData) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            20.heightBox,
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.blueColor,
              ),
              child: IconButton(
                onPressed: () => openImagePicker(ref),
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  size: 50,
                  color: Colors.white,
                ),
              )
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
            // ElevatedButton(
            //   onPressed: () => logout(ref, context),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: AppTheme.blueColor,
            //   ),
            //   child: 'Update'.text.white.bold.size(20).make(),
            // ).box.size(double.infinity, 55).make(),
          ],
        ).pSymmetric(h: 20, v: 10),
        error: (error, printStackTrace) => ErrorText(error: error.toString()),
        loading: () => const Loader(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih23/src/core/common/error_text.dart';
import 'package:sih23/src/core/common/loader.dart';
import 'package:sih23/src/core/constants/app_constants.dart';
import 'package:sih23/src/features/auth/controllers/auth_controller.dart';
import 'package:sih23/src/features/home/widgets/drawer_plate.dart';
import 'package:sih23/src/routes/app_routes.dart';
import 'package:sih23/src/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDrawer extends ConsumerWidget {
  const HomeDrawer({
    super.key,
  });

  void logout(WidgetRef ref, BuildContext context) {
    ref.read(authControllerProvider.notifier).logout(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangeProvider);
    final isLoading = ref.watch(authControllerProvider);
    return authState.when(
      data: (data) => isLoading
          ? const Loader()
          : Column(
              children: [
                50.heightBox,
                if (data != null)
                  ref.watch(getUserDataProvider(data.uid)).when(
                        data: (user) => Column(
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
                                    user.profilePicture,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            5.heightBox,
                            user.name.text.bold.size(20).make(),
                            Divider(color: AppTheme.greyColor),
                            20.heightBox,
                            CustomDrawerPlate(
                              title: 'Profile',
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoute.profileRoute,
                                arguments: {'uid': user.uid},
                              ),
                            ),
                            10.heightBox,
                            CustomDrawerPlate(
                              title: 'Logout',
                              backgroundColor: AppTheme.redColor,
                              onTap: () {
                                logout(ref, context);
                                Navigator.pushNamed(
                                    context, AppRoute.loginRoute);
                              },
                            ),
                            20.heightBox,
                            if (user.userType == 'Farmer')
                              CustomDrawerPlate(
                                title: 'Create',
                                backgroundColor: AppTheme.greenColor,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoute.lastRoute,
                                    arguments: {'uid': user.uid},
                                  );
                                },
                              ),
                          ],
                        ),
                        loading: () => const Loader(),
                        error: (error, stackTrace) =>
                            ErrorText(error: error.toString()),
                      ),
                if (data == null)
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          image: const DecorationImage(
                            image: AssetImage(AppConstants.avatarDefault),
                            fit: BoxFit.fill,
                          ),
                          border: Border.all(color: AppTheme.greyColor),
                        ),
                      ),
                      5.heightBox,
                      'Apna Farmer'.text.bold.size(20).make(),
                      Divider(color: AppTheme.greyColor),
                      20.heightBox,
                      CustomDrawerPlate(
                        title: 'Profile',
                        onTap: () {},
                      ),
                      10.heightBox,
                      CustomDrawerPlate(
                        title: 'Register',
                        onTap: () => Navigator.pushNamed(
                            context, AppRoute.registerRoute),
                      ),
                    ],
                  ),
                10.heightBox,
                const Spacer(),
                Divider(color: AppTheme.greyColor),
                'Privacy Policy'
                    .text
                    .size(16)
                    .color(AppTheme.greyColor)
                    .semiBold
                    .make(),
                'Created by ADVAYAM'
                    .text
                    .size(16)
                    .color(AppTheme.greyColor)
                    .semiBold
                    .make(),
                'Version v.1.0.0'
                    .text
                    .size(16)
                    .color(AppTheme.greyColor)
                    .semiBold
                    .make(),
                30.heightBox,
              ],
            ),
      error: (error, printStackTrace) => ErrorText(error: error.toString()),
      loading: () => const Loader(),
    );
  }
}

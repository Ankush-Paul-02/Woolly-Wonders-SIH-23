import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sih23/src/core/common/loader.dart';
import 'package:sih23/src/core/constants/app_constants.dart';
import 'package:sih23/src/features/auth/controllers/auth_controller.dart';
import 'package:sih23/src/features/home/user/controller/user_profile_controller.dart';
import 'package:sih23/src/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/common/error_text.dart';

class TestModule extends ConsumerStatefulWidget {
  const TestModule({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TestModuleState();
}

class _TestModuleState extends ConsumerState<TestModule> {
  void register(String uid, WidgetRef ref) {
    ref.read(userProfileControllerProvider.notifier).register(uid);
  }

  void applyForQualityAssurance(String uid, WidgetRef ref) {
    ref.read(userProfileControllerProvider.notifier).qualityForAssurance(uid);
  }

  late SharedPreferences prefs;
  late int endTimeMillis;

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  void initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    // Retrieve the stored end time, or set a default value (e.g., -1) if not stored
    endTimeMillis = prefs.getInt('endTimeMillis') ?? -1;
  }

  void startCountdown() {
    // Calculate the end time (e.g., 1 hour from now)
    endTimeMillis = DateTime.now().millisecondsSinceEpoch + 60 * 60 * 1000;

    // Store the end time
    prefs.setInt('endTimeMillis', endTimeMillis);

    // Force a rebuild to start the countdown
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateChangeProvider);

    return authState.when(
      data: (data) => Scaffold(
          body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ref.watch(getUserDataProvider(data!.uid)).when(
                        data: (user) => user.isRegistered
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  'Unravel the\nMagic of Testing'
                                      .text
                                      .bold
                                      .size(24)
                                      .make(),
                                  30.heightBox,
                                  //! Quality assurance
                                  Card(
                                    elevation: 2,
                                    child: Container(
                                      height: 200,
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          'Quality Assurance'
                                              .text
                                              .bold
                                              .size(18)
                                              .make()
                                              .centered(),
                                          const Divider(),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  height: 100,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        AppConstants.quality,
                                                      ),
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: SizedBox(
                                                  height: 120,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      '- Rating the best quality'
                                                          .text
                                                          .color(AppTheme
                                                              .greyColor)
                                                          .semiBold
                                                          .size(16)
                                                          .make(),
                                                      '- Report generation'
                                                          .text
                                                          .semiBold
                                                          .color(AppTheme
                                                              .greyColor)
                                                          .size(16)
                                                          .make(),
                                                      '- Certification'
                                                          .text
                                                          .semiBold
                                                          .color(AppTheme
                                                              .greyColor)
                                                          .size(16)
                                                          .make(),
                                                      10.heightBox,
                                                      const Spacer(),
                                                      ElevatedButton(
                                                        // onPressed: () => Navigator.pushNamed(context, AppRoute.qualityRoute, arguments: {'uid': data.uid}),
                                                        onPressed: () =>
                                                            applyForQualityAssurance(
                                                                data.uid, ref),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              AppTheme
                                                                  .greenColor,
                                                        ),
                                                        child: user
                                                                .isAppliedForAssurance
                                                            ? 'Applied'
                                                                .text
                                                                .white
                                                                .bold
                                                                .size(20)
                                                                .make()
                                                                .shimmer(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      AppTheme
                                                                          .whiteColor,
                                                                      AppTheme
                                                                          .greenColor
                                                                          .withOpacity(
                                                                              0.2),
                                                                    ],
                                                                  ),
                                                                  showAnimation:
                                                                      true,
                                                                  primaryColor:
                                                                      AppTheme
                                                                          .whiteColor,
                                                                  secondaryColor: AppTheme
                                                                      .greenColor
                                                                      .withOpacity(
                                                                          0.9),
                                                                )
                                                            : 'Apply'
                                                                .text
                                                                .white
                                                                .bold
                                                                .size(20)
                                                                .make()
                                                                .shimmer(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      AppTheme
                                                                          .whiteColor,
                                                                      AppTheme
                                                                          .greenColor
                                                                          .withOpacity(
                                                                              0.2),
                                                                    ],
                                                                  ),
                                                                  showAnimation:
                                                                      true,
                                                                  primaryColor:
                                                                      AppTheme
                                                                          .whiteColor,
                                                                  secondaryColor: AppTheme
                                                                      .greenColor
                                                                      .withOpacity(
                                                                          0.9),
                                                                ),
                                                      )
                                                          .box
                                                          .size(double.infinity,
                                                              40)
                                                          .make(),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  20.heightBox,
                                  //! Procedure assurance
                                  Card(
                                    elevation: 2,
                                    child: Container(
                                      height: 200,
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          'Procedure Assurance'
                                              .text
                                              .bold
                                              .size(18)
                                              .make()
                                              .centered(),
                                          const Divider(),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  height: 100,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        AppConstants.procedure,
                                                      ),
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: SizedBox(
                                                  height: 120,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      '- Review of every step\n  of wool processing'
                                                          .text
                                                          .color(AppTheme
                                                              .greyColor)
                                                          .semiBold
                                                          .size(16)
                                                          .make(),
                                                      10.heightBox,
                                                      const Spacer(),
                                                      ElevatedButton(
                                                        onPressed: () {},
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              AppTheme
                                                                  .greenColor,
                                                        ),
                                                        child: 'Apply'
                                                            .text
                                                            .white
                                                            .bold
                                                            .size(18)
                                                            .make()
                                                            .shimmer(
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  AppTheme
                                                                      .whiteColor,
                                                                  AppTheme
                                                                      .greenColor
                                                                      .withOpacity(
                                                                          0.2),
                                                                ],
                                                              ),
                                                              showAnimation:
                                                                  true,
                                                              primaryColor:
                                                                  AppTheme
                                                                      .whiteColor,
                                                              secondaryColor:
                                                                  AppTheme
                                                                      .greenColor
                                                                      .withOpacity(
                                                                          0.9),
                                                            ),
                                                      )
                                                          .box
                                                          .size(double.infinity,
                                                              40)
                                                          .make(),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  20.heightBox,
                                  Card(
                                    elevation: 2,
                                    child: Container(
                                      height: 200,
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          'Quarterly Visit'
                                              .text
                                              .bold
                                              .size(18)
                                              .make()
                                              .centered(),
                                          const Divider(),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  height: 100,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        AppConstants.visit,
                                                      ),
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: SizedBox(
                                                  height: 120,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      '- Apply for physical visit'
                                                          .text
                                                          .color(AppTheme
                                                              .greyColor)
                                                          .semiBold
                                                          .size(16)
                                                          .make(),
                                                      10.heightBox,
                                                      const Spacer(),
                                                      Container(
                                                        height: 60,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          color: AppTheme
                                                              .greenColor,
                                                        ),
                                                        child:
                                                            user.isAppliedForAssurance ==
                                                                    true
                                                                ? CountdownTimer(
                                                                    endTime: DateTime.now()
                                                                            .millisecondsSinceEpoch +
                                                                        60 *
                                                                            60 *
                                                                            1000, // 2 minutes
                                                                    textStyle:
                                                                        const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                                    endWidget: 'Visiting team will arrived soon'
                                                                        .text
                                                                        .white
                                                                        .make()
                                                                        .centered(),
                                                                  ).centered()
                                                                : 'Coming soon'
                                                                    .text
                                                                    .white
                                                                    .bold
                                                                    .size(18)
                                                                    .make()
                                                                    .shimmer(
                                                                      gradient:
                                                                          LinearGradient(
                                                                        colors: [
                                                                          AppTheme
                                                                              .whiteColor,
                                                                          AppTheme
                                                                              .greenColor
                                                                              .withOpacity(0.2),
                                                                        ],
                                                                      ),
                                                                      showAnimation:
                                                                          true,
                                                                      primaryColor:
                                                                          AppTheme
                                                                              .whiteColor,
                                                                      secondaryColor: AppTheme
                                                                          .greenColor
                                                                          .withOpacity(
                                                                              0.9),
                                                                    )
                                                                    .centered(),
                                                      )
                                                          .box
                                                          .size(double.infinity,
                                                              40)
                                                          .make(),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ).pSymmetric(h: 16, v: 12)
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppTheme.greyColor,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        'For further procedure you have to do the registration through payment'
                                            .text
                                            .semiBold
                                            .size(18)
                                            .color(AppTheme.greyColor)
                                            .make(),
                                        const Spacer(),
                                        ElevatedButton(
                                          onPressed: () =>
                                              register(data.uid, ref),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppTheme.greenColor,
                                          ),
                                          child: 'Payment'
                                              .text
                                              .white
                                              .bold
                                              .size(18)
                                              .make()
                                              .shimmer(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    AppTheme.whiteColor,
                                                    AppTheme.greenColor
                                                        .withOpacity(0.2),
                                                  ],
                                                ),
                                                showAnimation: true,
                                                primaryColor:
                                                    AppTheme.whiteColor,
                                                secondaryColor: AppTheme
                                                    .greenColor
                                                    .withOpacity(0.9),
                                              ),
                                        ).box.size(double.infinity, 40).make(),
                                      ],
                                    ).pSymmetric(v: 10, h: 20),
                                  )
                                ],
                              ).pSymmetric(h: 20, v: 10),
                        error: (error, printStackTrace) =>
                            ErrorText(error: error.toString()),
                        loading: () => const Loader(),
                      ),
                ],
              ))),
      error: (error, printStackTrace) => ErrorText(error: error.toString()),
      loading: () => const Loader(),
    );
  }
}

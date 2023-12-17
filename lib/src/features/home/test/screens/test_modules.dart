import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih23/src/core/constants/app_constants.dart';
import 'package:sih23/src/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class TestModule extends ConsumerStatefulWidget {
  const TestModule({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TestModuleState();
}

class _TestModuleState extends ConsumerState<TestModule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            'Unravel the\nMagic of Testing'.text.bold.size(24).make(),
            30.heightBox,
            //! Quality assurance
            Card(
              elevation: 2,
              child: Container(
                height: 200,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'Quality Assurance'.text.bold.size(18).make().centered(),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 100,
                            decoration: const BoxDecoration(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                '- Rating the best quality'
                                    .text
                                    .color(AppTheme.greyColor)
                                    .semiBold
                                    .size(16)
                                    .make(),
                                '- Report generation'
                                    .text
                                    .semiBold
                                    .color(AppTheme.greyColor)
                                    .size(16)
                                    .make(),
                                '- Certification'
                                    .text
                                    .semiBold
                                    .color(AppTheme.greyColor)
                                    .size(16)
                                    .make(),
                                10.heightBox,
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppTheme.greenColor,
                                  ),
                                  child: 'Apply'
                                      .text
                                      .white
                                      .bold
                                      .size(20)
                                      .make()
                                      .shimmer(
                                        gradient: LinearGradient(
                                          colors: [
                                            AppTheme.whiteColor,
                                            AppTheme.greenColor.withOpacity(0.2),
                                          ],
                                        ),
                                        showAnimation: true, 
                                        primaryColor: AppTheme.whiteColor,
                                        secondaryColor: AppTheme.greenColor.withOpacity(0.9),
                                      ),
                                ).box.size(double.infinity, 40).make(),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'Procedure Assurance'.text.bold.size(18).make().centered(),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 100,
                            decoration: const BoxDecoration(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                '- Review of every step\n  of wool processing'
                                    .text
                                    .color(AppTheme.greyColor)
                                    .semiBold
                                    .size(16)
                                    .make(),
                                10.heightBox,
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppTheme.greenColor,
                                  ),
                                  child:
                                      'Apply'.text.white.bold.size(18).make().shimmer(
                                        gradient: LinearGradient(
                                          colors: [
                                            AppTheme.whiteColor,
                                            AppTheme.greenColor.withOpacity(0.2),
                                          ],
                                        ),
                                        showAnimation: true, 
                                        primaryColor: AppTheme.whiteColor,
                                        secondaryColor: AppTheme.greenColor.withOpacity(0.9),
                                      ),
                                ).box.size(double.infinity, 40).make(),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'Quarterly Visit'.text.bold.size(18).make().centered(),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 100,
                            decoration: const BoxDecoration(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                '- Apply for physical visit'
                                    .text
                                    .color(AppTheme.greyColor)
                                    .semiBold
                                    .size(16)
                                    .make(),
                                10.heightBox,
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppTheme.greenColor,
                                  ),
                                  child:
                                      'Apply'.text.white.bold.size(18).make().shimmer(
                                        gradient: LinearGradient(
                                          colors: [
                                            AppTheme.whiteColor,
                                            AppTheme.greenColor.withOpacity(0.2),
                                          ],
                                        ),
                                        showAnimation: true, 
                                        primaryColor: AppTheme.whiteColor,
                                        secondaryColor: AppTheme.greenColor.withOpacity(0.9),
                                      ),
                                ).box.size(double.infinity, 40).make(),
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
        ).pSymmetric(h: 16, v: 12),
      ),
    );
  }
}

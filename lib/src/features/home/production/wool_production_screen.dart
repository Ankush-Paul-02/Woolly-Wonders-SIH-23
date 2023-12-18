// ignore_for_file: library_private_types_in_public_api, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih23/src/core/constants/app_constants.dart';
import 'package:sih23/src/features/auth/controllers/auth_controller.dart';
import 'package:sih23/src/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/common/error_text.dart';
import '../../../core/common/loader.dart';

class WoolProductionScreen extends ConsumerStatefulWidget {
  const WoolProductionScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WoolProductionScreenState();
}

class _WoolProductionScreenState extends ConsumerState<WoolProductionScreen> {
  String selectedData = 'India';

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateChangeProvider);
    return authState.when(
      data: (data) => Scaffold(
        backgroundColor: AppTheme.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ref.watch(getUserDataProvider(data?.uid ?? 'defaultUid')).when(
                    data: (user) => user != null
                        ? 'Hey,\nGood Morning ${user.name}'
                            .text
                            .bold
                            .size(24)
                            .make()
                        : const SizedBox(),
                    error: (error, printStackTrace) =>
                        ErrorText(error: error.toString()),
                    loading: () => const Loader(),
                  ),
              'Explore the best high-quality wools worldwide..'
                  .text
                  .normal
                  .color(AppTheme.greyColor)
                  .size(18)
                  .make(),
              16.heightBox,
              const Divider(),
              16.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  'Wool Productions'.text.bold.black.size(20).make(),
                  5.widthBox,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: DropdownButton<String>(
                      value: selectedData,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedData = newValue!;
                        });
                      },
                      items: [
                        'India',
                        'Rajasthan',
                        'Jammu & Kashmir',
                        'Uttar Pradesh',
                        'Gujarat',
                        'Madhya Pradesh',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      underline: Container(),
                    ),
                  ),
                ],
              ),
              20.heightBox,
              Container(
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black45),
                  image: const DecorationImage(
                    image: AssetImage(
                      AppConstants.india,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ).pSymmetric(h: 16, v: 12),
        ),
      ),
      error: (error, printStackTrace) => ErrorText(error: error.toString()),
      loading: () => const Loader(),
    );
  }
}

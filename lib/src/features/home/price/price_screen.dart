import 'package:flutter/material.dart';
import 'package:sih23/src/core/constants/app_constants.dart';
import 'package:sih23/src/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class PriceScreen extends StatelessWidget {
  const PriceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          'Wool Prices'.text.bold.size(22).make(),
          14.heightBox,
          Expanded(
            child: ListView.builder(
              itemCount: AppConstants().trendWools.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppTheme.blueColor,
                            width: 2.0,
                          ),
                        ),
                        child: CircleAvatar(
                          maxRadius: 50,
                          backgroundImage: NetworkImage(
                              AppConstants().trendWools[index]['image']!),
                        ),
                      ),
                      10.widthBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppConstants()
                              .trendWools[index]['name']!
                              .text
                              .bold
                              .size(16)
                              .make(),
                          5.heightBox,
                          AppConstants()
                              .trendWools[index]['price']!
                              .text
                              .semiBold
                              .color(AppTheme.blueColor)
                              .size(14)
                              .make(),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ).pSymmetric(h: 20, v: 10),
    );
  }
}

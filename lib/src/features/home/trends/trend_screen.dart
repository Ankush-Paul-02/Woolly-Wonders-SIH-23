import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sih23/src/core/common/loader.dart';
import 'package:sih23/src/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/constants/app_constants.dart';
import '../news/news_list_item.dart';

class TrendScreen extends StatefulWidget {
  const TrendScreen({super.key});

  @override
  State<TrendScreen> createState() => _TrendScreenState();
}

class _TrendScreenState extends State<TrendScreen> {
  List<Map<String, String>> newsList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    const apiKey = AppConstants.newsApiKey;
    const apiUrl = AppConstants.newsApiUrl;
    const query = AppConstants.newsQuery;

    try {
      final response = await http.get(
        Uri.parse(
          '$apiUrl?q=$query&apiKey=$apiKey',
        ),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        if (data['status'] == 'ok') {
          final List<dynamic> articles = data['articles'];
          setState(() {
            newsList = articles
                .map((article) => {
                      'title': article['title'] as String,
                      'description': article['description'] as String,
                      'url': article['url'] as String,
                    })
                .toList();
            isLoading = false;
          });
        }
      } else {
        debugPrint('Error: ${response.statusCode}');
        isLoading = false;
      }
    } catch (error) {
      debugPrint('Error: $error');
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: isLoading
          ? const Loader()
          : CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'Trending Wools'.text.bold.size(22).make(),
                      14.heightBox,
                      SizedBox(
                        height: 140,
                        child: ListView.builder(
                          itemCount: AppConstants().trendWools.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return HStack([
                              Column(
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
                                          AppConstants().trendWools[index]
                                              ['image']!),
                                    ),
                                  ),
                                  5.heightBox,
                                  AppConstants()
                                      .trendWools[index]['name']!
                                      .text
                                      .semiBold
                                      .size(14)
                                      .make(),
                                ],
                              ),
                              10.widthBox,
                            ]);
                          },
                        ),
                      ),
                      24.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          'Top Farmers'.text.bold.size(20).make(),
                          TextButton(
                            onPressed: () {},
                            child: 'See All'
                                .text
                                .semiBold
                                .size(14)
                                .color(AppTheme.redColor)
                                .make(),
                          ),
                        ],
                      ),
                      14.heightBox,
                      SizedBox(
                        height: 140,
                        child: ListView.builder(
                          itemCount: AppConstants().woolSellers.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return HStack([
                              Column(
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
                                          AppConstants().woolSellers[index]
                                              ['image']!),
                                    ),
                                  ),
                                  5.heightBox,
                                  AppConstants()
                                      .woolSellers[index]['name']!
                                      .text
                                      .semiBold
                                      .size(14)
                                      .make(),
                                ],
                              ),
                              10.widthBox,
                            ]);
                          },
                        ),
                      ),
                      24.heightBox,
                      'Top Textile News'.text.bold.size(24).make(),
                      14.heightBox,
                    ],
                  ).pOnly(left: 16),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final news = newsList[index];
                      return NewsListItem(
                        title: news['title'] ?? '',
                        description: news['description'] ?? '',
                        url: news['url'] ?? '',
                      );
                    },
                    childCount: newsList.length,
                  ),
                ),
              ],
            ),
    );
  }
}

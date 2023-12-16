// ignore_for_file: library_private_types_in_public_api
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sih23/src/features/home/news/news_list_item.dart';
import 'package:sih23/src/theme/theme.dart';

import '../../../core/constants/app_constants.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
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
      body: SafeArea(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: AppTheme.redColor,
                ),
              )
            : ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  final news = newsList[index];
                  return NewsListItem(
                    title: news['title'] ?? '',
                    description: news['description'] ?? '',
                    url: news['url'] ?? '',
                  );
                },
              ),
      ),
    );
  }
}

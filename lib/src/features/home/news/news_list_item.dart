import 'package:flutter/material.dart';
import 'package:sih23/src/features/home/news/news_web_view.dart';
import 'package:sih23/src/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class NewsListItem extends StatelessWidget {
  final String title;
  final String description;
  final String url;

  const NewsListItem({
    Key? key,
    required this.title,
    required this.description,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.blueColor,
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebViewScreen(url: url),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title.text.bold.white.size(18).make(),
                  8.heightBox,
                  description.text.normal.size(18).make(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

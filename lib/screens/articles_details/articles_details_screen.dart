import 'package:flutter/material.dart';
import 'package:food_app/models/ArticleAssets.dart';
import 'package:food_app/screens/articles_details/components/body.dart';

class ArticlesDetails extends StatelessWidget {
  final ArticleAssets articleAssets;
  const ArticlesDetails({Key? key, required this.articleAssets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        articleAssets: articleAssets,
      ),
    );
  }
}

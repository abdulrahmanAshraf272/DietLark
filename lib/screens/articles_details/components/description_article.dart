import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/ArticleAssets.dart';
import 'package:food_app/models/DiseasesAssets.dart';
import 'package:food_app/size_config.dart';

class DescriptionArticle extends StatelessWidget {
  final ArticleAssets articleAssets;
  const DescriptionArticle({
    Key? key,
    required this.articleAssets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            articleAssets.description,
            style: TextStyle(fontFamily: kPrimaryFont, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

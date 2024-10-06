import 'package:flutter/material.dart';
import 'package:food_app/models/ArticleAssets.dart';
import 'package:food_app/models/ads_test/bannar_ad_model.dart';
import 'package:food_app/models/ads_test/interstitial_ad_model.dart';
import 'package:food_app/screens/articles_details/components/description_article.dart';
import 'package:food_app/screens/articles_details/components/header_and_title.dart';

class Body extends StatefulWidget {
  final ArticleAssets articleAssets;
  const Body({Key? key, required this.articleAssets}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Display Ad if the user came from notification
    displayAdNotiIsClicked();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    displayInterstialAdDipose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var statebarHeight = MediaQuery.of(context).viewPadding.top;
    return Stack(
      children: [
        Positioned.fill(
          child: Column(
            children: [
              HeaderAndTitle(
                statebarHeight: statebarHeight,
                articleAssets: widget.articleAssets,
              ),
              DescriptionArticle(
                articleAssets: widget.articleAssets,
              ),
            ],
          ),
        ),
        Positioned(bottom: 0, right: 0, left: 0, child: AdBannarContainer())
      ],
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/ArticleAssets.dart';
import 'package:food_app/models/ads_test/interstitial_ad_model.dart';
import 'package:food_app/screens/articles_details/articles_details_screen.dart';
import 'package:food_app/size_config.dart';

class ArticlesSection extends StatelessWidget {
  const ArticlesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _cardWidth = SizeConfig.screenWidth * 0.8;
    double _cardHeight = _cardWidth * 0.57;
    return SizedBox(
      height: _cardHeight + 20,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: articlesList.length,
        padding: EdgeInsets.only(right: 20, bottom: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) => ArticleCard(
              articleAssets: articlesList[index],
            )),
      ),
    );
    ;
  }
}

class ArticleCard extends StatelessWidget {
  final ArticleAssets articleAssets;
  const ArticleCard({
    Key? key,
    required this.articleAssets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _cardWidth = SizeConfig.screenWidth * 0.8;
    double _cardHeight = _cardWidth * 0.57;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticlesDetails(
                      articleAssets: articleAssets,
                    )));
        //To load interstritial ad to Display it.
        MyInterstitailAd.loadInterstitialAd();
      },
      child: Container(
          width: _cardWidth,
          height: _cardHeight - 30,
          margin: EdgeInsets.only(
            left: 20,
          ),
          child: Stack(
            children: [
              Positioned.fill(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  articleAssets.image,
                  fit: BoxFit.cover,
                ),
              )),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: _cardHeight - 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.transparent
                          ])),
                ),
              ),
              Positioned(
                  bottom: 15,
                  right: 15,
                  child: Container(
                    width: _cardWidth,
                    padding: EdgeInsets.only(left: 20),
                    child: AutoSizeText(
                      articleAssets.title,
                      style: TextStyle(
                          fontFamily: kPrimaryFont,
                          fontSize: 20,
                          color: Colors.white),
                      maxLines: 2,
                    ),
                  ))
            ],
          )),
    );
  }
}

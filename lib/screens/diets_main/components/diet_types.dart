import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/DietTypesAssets.dart';
import 'package:food_app/models/ads_test/interstitial_ad_model.dart';
import 'package:food_app/screens/dietType_details/dietType_details_screen.dart';
import 'package:food_app/size_config.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DietTypes extends StatelessWidget {
  const DietTypes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double _cardWidth = screenWidth * 0.8;
    double _cardHeight = _cardWidth / 1.7;
    return SizedBox(
      height: _cardHeight,
      child: ListView(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(bottom: 10),
          children: [
            CarouselSlider.builder(
                itemCount: dietTypesList.length,
                options: CarouselOptions(
                  autoPlay: true,
                  height: _cardHeight,
                  enlargeCenterPage: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                ),
                itemBuilder: (context, index, realIndex) =>
                    DietTypeCard(dietTypesAssets: dietTypesList[index])),
          ]),
    );
  }
}

class DietTypeCard extends StatelessWidget {
  final DietTypesAssets dietTypesAssets;
  const DietTypeCard({
    super.key,
    required this.dietTypesAssets,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double _cardWidth = screenWidth * 0.8;
    double _cardHeight = _cardWidth / 1.7;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DietTypeDetails(dietTypesAssets: dietTypesAssets)));
        //to Load the interstitial ad or praper it to display it.
        MyInterstitailAd.loadInterstitialAd();
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          width: _cardWidth,
          height: _cardHeight,
          //margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [kDefaultShadow],
              image: DecorationImage(
                image: AssetImage(
                  dietTypesAssets.image,
                ),
                fit: BoxFit.cover,
              )),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: _cardWidth,
              height: _cardHeight,
              color: Colors.black.withOpacity(0.4),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: _cardHeight * 0.09,
                    ),
                    Expanded(
                      child: AutoSizeText(
                        dietTypesAssets.title,
                        style: TextStyle(
                            fontFamily: kFontDGSahabah,
                            fontSize: 26,
                            color: Colors.white),
                        maxLines: 1,
                      ),
                    ),
                    Expanded(
                      child: AutoSizeText(
                        dietTypesAssets.subtitle,
                        style: TextStyle(
                            fontFamily: kPrimaryFont,
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.85)),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Spacer()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

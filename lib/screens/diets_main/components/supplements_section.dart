import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/models/SupplementsAssets.dart';
import 'package:food_app/models/ads_test/interstitial_ad_model.dart';
import 'package:food_app/screens/premium_pages/cash_or_share/cash_or_share_screen.dart';
import 'package:food_app/screens/supplement_details/supplement_details_screen.dart';
import 'package:food_app/size_config.dart';
import 'package:get/get.dart';

double _cardWidth = (SizeConfig.screenWidth - 90) / 2;

class SupplementsSection extends StatelessWidget {
  const SupplementsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _cardWidth + 33,
      child: ListView.builder(
        padding: EdgeInsets.only(right: 20, bottom: 20),
        itemCount: supplementsList.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: ((context, index) => SupplementCard(
              supplementsAssets: supplementsList[index],
            )),
      ),
    );
  }
}

class SupplementCard extends StatelessWidget {
  final SupplementsAssets supplementsAssets;
  const SupplementCard({
    Key? key,
    required this.supplementsAssets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (HoldValues.PREMIUM_ACCOUNT == 0 && supplementsAssets.id > 3) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CashOrShare()));
        } else {
          Get.to(() => SupplementDetails(supplementsAssets: supplementsAssets),
              duration: Duration(milliseconds: 700));
          MyInterstitailAd.loadInterstitialAd();
          print('interstiial ad is loading ...');
        }
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, top: 3),
        height: _cardWidth + 30,
        width: _cardWidth,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 0), blurRadius: 2, color: Colors.black26)
            ]),
        child: Stack(
          children: [
            HoldValues.PREMIUM_ACCOUNT == 0 && supplementsAssets.id > 3
                ? Positioned(
                    top: 4,
                    right: 4,
                    child: Icon(
                      Icons.lock,
                      size: 17,
                      color: Colors.black.withOpacity(0.2),
                    ))
                : SizedBox(),
            Positioned.fill(
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 8),
                      height: _cardWidth - 35,
                      child: Hero(
                          tag: 'location-img-${supplementsAssets.image}',
                          child: Image.asset(supplementsAssets.image))),
                  AutoSizeText(
                    supplementsAssets.name,
                    style: TextStyle(
                        fontFamily: kSecondaryFont,
                        fontSize: 16,
                        color: Color(0xff333333)),
                    maxLines: 1,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

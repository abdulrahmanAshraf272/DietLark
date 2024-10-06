import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/models/NutrientsAssets.dart';
import 'package:food_app/screens/explain_nutrient/explain_nutrient_screen.dart';
import 'package:food_app/screens/premium_pages/cash_or_share/cash_or_share_screen.dart';
import 'package:food_app/size_config.dart';
import 'package:carousel_slider/carousel_slider.dart';

////////////////// - Featured plants -/////////////////////

class NutrientsSection extends StatelessWidget {
  const NutrientsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double cardWidth = screenWidth * 0.8;
    double cardHeight = cardWidth * 0.61;
    return SizedBox(
      height: cardHeight,
      child: CarouselSlider.builder(
        itemCount: nutrientsList.length,
        options: CarouselOptions(
          autoPlay: true,
          height: cardHeight,
          enlargeCenterPage: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
        ),
        itemBuilder: (context, index, realIndex) =>
            NutrientCard(nutrientsAssets: nutrientsList[index]),
      ),
    );
  }
}

/* 
SizedBox(
      height: cardHeight + 20,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: nutrientsList.length,
        padding: EdgeInsets.only(right: 20, bottom: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) =>
            NutrientCard(nutrientsAssets: nutrientsList[index])),
      ),
    );
*/

//itemBuilder: ((context, index) =>NutrientCard(nutrientsAssets: nutrientsList[index])),

class NutrientCard extends StatelessWidget {
  final NutrientsAssets nutrientsAssets;
  const NutrientCard({Key? key, required this.nutrientsAssets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double cardWidth = screenWidth * 0.8;
    double cardHeight = cardWidth * 0.60;
    return GestureDetector(
      onTap: () async {
        if (HoldValues.PREMIUM_ACCOUNT == 0 && nutrientsAssets.id > 3) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CashOrShare()));
        } else {
          int res = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExplainNutrient(
                            nutrientsAssets: nutrientsAssets,
                          ))) ??
              0;
          HoldValues.notificationClicked = true;
          if (res == 1) {
            Navigator.pop(context);
          }
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          width: cardWidth,
          height: cardHeight,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(
            left: 0,
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(nutrientsAssets.image), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
              //color: kGray2.withOpacity(0.8),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 3),
                    blurRadius: 4,
                    color: Colors.black45.withOpacity(0.23))
              ]),
          child: Stack(
            children: [
              HoldValues.PREMIUM_ACCOUNT == 0 && nutrientsAssets.id > 3
                  ? Positioned(
                      bottom: 0,
                      right: 3,
                      child: Icon(
                        Icons.lock,
                        size: 19,
                        color: Colors.black.withOpacity(0.2),
                      ))
                  : SizedBox(),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: cardWidth / 2 - 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "أكلات غنية بـ",
                          style: TextStyle(
                              fontFamily: kSecondaryFont,
                              fontSize: 18,
                              color: Colors.white),
                          maxLines: 1,
                        ),
                        AutoSizeText(
                          nutrientsAssets.title,
                          style: TextStyle(
                              fontFamily: kPrimaryFont,
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                              color: Colors.white),
                          maxLines: 1,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

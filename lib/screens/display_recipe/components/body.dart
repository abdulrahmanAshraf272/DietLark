import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/RecipeAssets.dart';
import 'package:food_app/models/ads_test/bannar_ad_model.dart';
import 'package:food_app/models/ads_test/interstitial_ad_model.dart';
import 'package:food_app/models/description.dart';
import 'package:food_app/screens/display_recipe/components/header_and_recipeName.dart';
import 'package:food_app/size_config.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'time_and_meals_bar.dart';

class Body extends StatefulWidget {
  final RecipeAssets recipeAssets;
  const Body({Key? key, required this.recipeAssets}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    displayAdNotiIsClicked();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var statebarHeight = MediaQuery.of(context).viewPadding.top;
    return Stack(
      children: [
        Positioned.fill(
          child: Column(
            children: [
              HeaderAndRecipeName(
                name: widget.recipeAssets.name,
                image: widget.recipeAssets.image,
              ),
              TimeAndMealsBar(
                cookingTime: widget.recipeAssets.cookingTime,
                mealsNo: widget.recipeAssets.mealsNo,
                calories: widget.recipeAssets.calories,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: "المكونات \n",
                            style: TextStyle(
                                fontFamily: kPrimaryFont,
                                fontSize: 22,
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text: widget.recipeAssets.ingredients,
                              style: TextStyle(
                                  fontFamily: kPrimaryFont,
                                  fontSize: 16,
                                  color: Color(0xFF333333)))
                        ])),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: "طريقة التحضير \n",
                            style: TextStyle(
                                fontFamily: kPrimaryFont,
                                fontSize: 22,
                                color: Color(0xFF333333),
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text: widget.recipeAssets.prepare,
                              style: TextStyle(
                                  fontFamily: kPrimaryFont,
                                  fontSize: 16,
                                  color: Color(0xFF333333)))
                        ])),
                        Text(
                          "القيمة الغذائية لكل وجبة",
                          style: TextStyle(
                              fontFamily: kPrimaryFont,
                              fontSize: 22,
                              color: Color(0xFF333333),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: screenWidth,
                          child: Row(
                            children: [
                              CaloriesAndMacros(
                                title: "سعرات",
                                amount: widget.recipeAssets.calories,
                              ),
                              CaloriesAndMacros(
                                title: "بروتين",
                                amount: widget.recipeAssets.protein,
                              ),
                              CaloriesAndMacros(
                                title: "كربوهيدرات",
                                amount: widget.recipeAssets.carb,
                              ),
                              CaloriesAndMacros(
                                title: "دهون",
                                amount: widget.recipeAssets.fat,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(bottom: 0, right: 0, left: 0, child: AdBannarContainer())
      ],
    );
  }
}

class CaloriesAndMacros extends StatelessWidget {
  const CaloriesAndMacros({
    super.key,
    required this.title,
    required this.amount,
  });

  final String title;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            "${amount}\n",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: kPrimaryFont, fontSize: 20, color: kTextColor2),
            maxLines: 1,
          ),
          Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: kPrimaryFont,
                  fontSize: 12,
                  color: Colors.black87))
        ],
      ),
    );
  }
}

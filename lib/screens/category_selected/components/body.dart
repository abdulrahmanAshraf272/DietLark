import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/models/CategoriesAssets.dart';
import 'package:food_app/models/FoodData.dart';
import 'package:food_app/models/ads_test/bannar_ad_model.dart';
import 'package:food_app/models/ads_test/interstitial_ad_model.dart';
import 'package:food_app/screens/food_details/food_details_screen.dart';
import 'package:food_app/size_config.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  final List theList;
  const Body({Key? key, required this.theList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ListView.separated(
            padding: EdgeInsets.only(bottom: 30),
            itemCount: theList.length,
            itemBuilder: (context, index) => ItemListView(
              foodData: theList[index],
            ),
            separatorBuilder: (context, index) {
              return Divider(
                height: 0.8,
                color: Colors.black38,
                indent: 30,
                endIndent: 30,
              );
            },
          ),
        ),
        Positioned(bottom: 0, right: 0, left: 0, child: AdBannarContainer())
      ],
    );
  }
}

class ItemListView extends StatelessWidget {
  final FoodData foodData;
  const ItemListView({
    Key? key,
    required this.foodData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () async {
        HoldValues.amountScaleS = foodData.amountScale;
        HoldValues.calories = foodData.calories;
        HoldValues.protein = foodData.protein;
        HoldValues.fat = foodData.fat;
        HoldValues.carb = foodData.carb;
        HoldValues.foodImage = foodData.image;
        HoldValues.foodDesc = foodData.description;
        HoldValues.foodTitle = foodData.title;
        HoldValues.isAdding = 1;

        //this code must be down, because if it is above the code below will not be exuted until
        //res variable get the value that he is waiting for .
        int res = await Get.to(
              () => FoodDetails(),
            ) ??
            0;
        //Load interstitial ad to display it
        MyInterstitailAd.loadInterstitialAd();
        if (res == 1) {
          Navigator.pop(context, 1);
        }
      },
      child: Container(
        height: 112,
        width: screenWidth,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Hero(
                tag: 'location2-img-${foodData.image}',
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                        image: AssetImage(foodData.image),
                      ),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodData.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: kPrimaryFont,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      foodData.amountScale == gramAmount
                          ? "لكل 100 جرام"
                          : foodData.amountScale == mediumAmount
                              ? "واحدة متوسطة الحجم"
                              : foodData.amountScale == sponAmount
                                  ? "معلقة كبيرة"
                                  : "كوب واحد",
                      style: TextStyle(
                          fontFamily: kPrimaryFont,
                          fontSize: 12,
                          color: Colors.black26),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  AutoSizeText(
                    foodData.calories.toString(),
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: kPrimaryFont,
                      fontSize: 22,
                      color: kRedColor,
                    ),
                  ),
                  Text(
                    "سعرة",
                    style: TextStyle(
                        fontFamily: kPrimaryFont,
                        fontSize: 12,
                        color: Colors.black54),
                  ),
                ],
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black45.withOpacity(0.4),
                size: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

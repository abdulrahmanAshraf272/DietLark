import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/models/FoodData.dart';
import 'package:food_app/models/ads_test/bannar_ad_model.dart';
import 'package:food_app/models/ads_test/interstitial_ad_model.dart';
import 'package:food_app/models/food_categories_lists.dart';
import 'package:food_app/models/movie_model.dart';
import 'package:food_app/screens/food_details/food_details_screen.dart';
import 'package:food_app/size_config.dart';

import '../../category_selected/components/body.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //creating dummy list movie for testing.
  static List<FoodData> allFoods = nutsList +
      meatsList +
      seafoodList +
      oilsList +
      birdsList +
      fruitsList +
      vegetablesList +
      beensList +
      legumesList +
      dairyList +
      bakeryList +
      dessertsList;

  //creating list that is going to display and filter
  List<FoodData> display_list2 = List.from(allFoods);

  void updateList(String value) {
    //this is the function that will filter our list.
    setState(() {
      display_list2 =
          allFoods.where((element) => element.title.contains(value)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    allFoods.shuffle();
    display_list2.shuffle(); //make the list random
    return Stack(
      children: [
        Positioned.fill(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  onChanged: (value) => updateList(value),
                  decoration: InputDecoration(
                    labelText: "بحث",
                    suffixIcon: Icon(Icons.search),
                  ),
                  autofocus:
                      true, //so when the page is open , automatically the search active.
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: display_list2.length == 0
                    ? Center(
                        child: Text(
                          "لا توجد نتائج",
                          style: TextStyle(
                              color: Colors.black87,
                              fontFamily: kPrimaryFont,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : ListView.builder(
                        itemCount: display_list2.length,
                        itemBuilder: ((context, index) =>
                            ItemList(foodData: display_list2[index])),
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

class ItemList extends StatelessWidget {
  final FoodData foodData;
  const ItemList({Key? key, required this.foodData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
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
            //To close the kayboard
            FocusManager.instance.primaryFocus?.unfocus();

            int res = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FoodDetails())) ??
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
                        SizedBox(
                          child: Text(
                            foodData.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: kPrimaryFont,
                              fontSize: 18,
                            ),
                          ),
                        ),
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
        ),
        Divider(
          height: 1,
          color: Colors.black38,
          indent: 30,
          endIndent: 30,
        )
      ],
    );
  }
}

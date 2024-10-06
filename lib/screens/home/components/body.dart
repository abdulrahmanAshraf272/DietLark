import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/models/ArticleAssets.dart';
import 'package:food_app/models/CategoriesAssets.dart';
import 'package:food_app/models/DiseasesAssets.dart';
import 'package:food_app/models/NutrientsAssets.dart';
import 'package:food_app/models/RecipeAssets.dart';
import 'package:food_app/models/SupplementsAssets.dart';
import 'package:food_app/models/ads_test/interstitial_ad_model.dart';
import 'package:food_app/models/food_categories_lists.dart';
import 'package:food_app/notification_database.dart';
import 'package:food_app/notifications.dart';
import 'package:food_app/screens/articles_details/articles_details_screen.dart';
import 'package:food_app/screens/category_selected/category_selected_screen.dart';
import 'package:food_app/screens/diets_main/diet_main_screen.dart';
import 'package:food_app/screens/display_recipe/display_recipe_screen.dart';
import 'package:food_app/screens/explain_disease/explain_disease_screen.dart';
import 'package:food_app/screens/explain_nutrient/explain_nutrient_screen.dart';
import 'package:food_app/screens/food_categories/food_categories_screen.dart';
import 'package:food_app/screens/food_details/food_details_screen.dart';
import 'package:food_app/screens/just_downloaded/welcome_page/welcome_screen.dart';
import 'package:food_app/screens/premium_pages/cash_or_share/cash_or_share_screen.dart';
import 'package:food_app/screens/rate_app/rate_app_screen.dart';
import 'package:food_app/screens/recipes/recipes_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:food_app/screens/supplement_details/supplement_details_screen.dart';
import 'package:food_app/screens/user_account/sign_up/sign_up_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_app/models/CategoriesAssets.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isPressed = false;
  bool isPressed2 = false;
  bool isPressed3 = false;

  var fbm = FirebaseMessaging.instance;

  saveDataText() async {
    final db = await FirebaseFirestore.instance;
    final user = await FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userInfo = {
        KEY_FIRST_NAME: 'abdo',
        KEY_SECOND_NAME: 'ashraf',
        KEY_GENDER: 1,
        KEY_PREMIUM: 0,
        KEY_HAVE_DIET: false
      };
      db
          .collection('users')
          .doc(user.uid)
          .set(userInfo, SetOptions(merge: true))
          .onError((e, _) => print("Error writing document: $e"));
    }
  }

  initialMessage() async {
    //onClick notification when the app is closed.
    var message = await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      notificationNavigation(context, message);
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    fbm.getToken().then((token) => print('the token is = $token'));
    print(HoldValues.USER_HAVE_DIET);
    super.initState();
    print(HoldValues.PREMIUM_ACCOUNT);
    if (HoldValues.RATE_COUNTER == 3) {
      Timer(Duration(seconds: 2), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RateApp()));
      });
    }
    //Handle notification click ,when the app in tirmenate mode (totally closed).
    initialMessage();

    //Handle notification click ,when the app in Background mode
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      // handle the notification here
      notificationNavigation(context, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double theBlur = 8;
    double theBlur2 = 6;
    Color shadowColor2 = Colors.black.withOpacity(0.8);

    Color shadowColor = Color(0xFFA7A9Af);
    Color firstCardColor = colorTheme2;
    Color secondCardColor = colorTheme3;
    Color thirdCardColor = colorTheme1;

    String firstCardImage = "assets/images/cherry.png";
    String secondCardImage = "assets/images/main_card_image7.png";
    String thirdCardImage = "assets/images/recipeCard.png";

    int premium = HoldValues.PREMIUM_ACCOUNT;
    print(HoldValues.PREMIUM_ACCOUNT);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 16, top: 16, bottom: 16),
              //height: screenHeight * 0.14,
              width: screenWidth,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "اعتني بصحتك",
                          style: TextStyle(
                              fontFamily: kPrimaryFont,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                          maxLines: 1,
                        ),
                        AutoSizeText(
                          "واكتشف كل يوم معلومة جديدة",
                          style:
                              TextStyle(fontFamily: kPrimaryFont, fontSize: 20),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print(HoldValues.PREMIUM_ACCOUNT);
                      if (premium == 0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CashOrShare()));
                      }
                    },
                    child: Lottie.asset(
                      premium == 1
                          ? "assets/icons/gold.json"
                          : "assets/icons/silver.json",
                      height: 65,
                    ),
                  )
                ],
              ),
            ),
            Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () async {
                    bool isConnected =
                        await HoldValues().checkInternetConnection();
                    if (isConnected) {
                      HoldValues.mealSelected = 0;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FoodCategories()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          'لا يوجد اتصال بالإنترنت',
                          style: TextStyle(
                              fontFamily: kPrimaryFont, color: Colors.white),
                        ),
                      ));
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 15),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: theBlur2,
                              color: shadowColor2)
                        ],
                        borderRadius: BorderRadius.circular(15),
                        color: firstCardColor),
                    child: CardContent(
                      paddingBottom: 5,
                      paddingTop: 5,
                      title: "السعرات والقيمة الغذائية للأطعمة",
                      subtitle:
                          "أكتشف أهم العناصر الغذائية ومصادر كل عنصر منها",
                      image: firstCardImage,
                      iconSrc: "assets/icons/card_icon1.png",
                      textIcon: "220 أكلة مختلفة",
                    ),
                  ),
                )),
            Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () async {
                    bool isConnected =
                        await HoldValues().checkInternetConnection();
                    if (isConnected) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DietMain()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          'لا يوجد اتصال بالإنترنت',
                          style: TextStyle(
                              fontFamily: kPrimaryFont, color: Colors.white),
                        ),
                      ));
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 15,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: theBlur2,
                              color: shadowColor2)
                        ],
                        borderRadius: BorderRadius.circular(15),
                        color: secondCardColor),
                    child: CardContent(
                      paddingBottom: 5,
                      paddingTop: 5,
                      title: "النظام الغذائي الخاص بك",
                      subtitle: "صمم نظامك الغذائي حسب هدفك ومستواك",
                      image: secondCardImage,
                      iconSrc: "assets/icons/card_icon2.png",
                      textIcon: "احسب سعراتك",
                    ),
                  ),
                )),
            Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () async {
                    bool isConnected =
                        await HoldValues().checkInternetConnection();
                    if (isConnected) {
                      if (HoldValues.PREMIUM_ACCOUNT == 0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CashOrShare()));
                      } else {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Recipes()));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          'لا يوجد اتصال بالإنترنت',
                          style: TextStyle(
                              fontFamily: kPrimaryFont, color: Colors.white),
                        ),
                      ));
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 15,
                    ),
                    padding: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: theBlur2,
                              color: shadowColor2)
                        ],
                        borderRadius: BorderRadius.circular(15),
                        color: thirdCardColor),
                    child: Stack(
                      children: [
                        Positioned(
                            top: 6,
                            left: 6,
                            child: HoldValues.PREMIUM_ACCOUNT == 0
                                ? Icon(
                                    Icons.lock,
                                    size: 20,
                                    color: Colors.white.withOpacity(0.22),
                                  )
                                : SizedBox()),
                        Positioned.fill(
                          child: CardContent(
                            paddingTop: screenHeight * 0.06,
                            paddingBottom: 0,
                            title: "وصفات اكلات شهية و صحية",
                            subtitle:
                                "أكتشف كل يوم الكثير من الوصفات الصحية والمتنوعة",
                            image: thirdCardImage,
                            iconSrc: "assets/icons/card_icon3.png",
                            textIcon: "150 وصفة",
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  const CardContent({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.iconSrc,
    required this.textIcon,
    required this.paddingTop,
    required this.paddingBottom,
  });

  final String image;
  final String title, subtitle, iconSrc, textIcon;
  final double paddingTop, paddingBottom;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              AutoSizeText(
                title,
                style: TextStyle(
                    fontSize: 21, //screenHeight * 0.031
                    color: Colors.white,
                    fontFamily: kPrimaryFont),
                maxLines: 2,
              ),
              SizedBox(
                height: 5,
              ),
              AutoSizeText(
                subtitle,
                style:
                    TextStyle(color: Colors.white54, fontFamily: kPrimaryFont),
                maxLines: 2,
              ),
              Spacer(),
              InfoRow(defualtSize: 10, iconSrc: iconSrc, textIcon: textIcon),
              SizedBox(
                height: 5,
              ),
              Spacer()
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(top: paddingTop, bottom: paddingBottom),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: screenWidth * 0.4,
                //height: screenHeight * 0.24,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

// Our category list need Stateful widget

class InfoRow extends StatelessWidget {
  const InfoRow(
      {super.key,
      required this.defualtSize,
      required this.iconSrc,
      required this.textIcon});

  final double defualtSize;
  final String iconSrc, textIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          iconSrc,
          width: 22,
          height: 22,
        ),
        SizedBox(
          width: defualtSize,
        ),
        Text(
          textIcon,
          style: TextStyle(color: Colors.white, fontFamily: kPrimaryFont),
        )
      ],
    );
  }
}

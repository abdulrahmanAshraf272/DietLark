import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/database_operations.dart';
import 'package:food_app/hold_values.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MakingDietPlan extends StatelessWidget {
  const MakingDietPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPercent = 0;

  Color activeText1 = Colors.black;
  Color activeText2 = Colors.black.withOpacity(0.4);
  Color activeText3 = Colors.black.withOpacity(0.4);
  Color activeText4 = Colors.black.withOpacity(0.4);
  Color activeText5 = Colors.black.withOpacity(0.4);

  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    calculateCaloriesAndMacrosIntake();
    startMakingDiet();
    super.initState();
  }

  void startMakingDiet() {
    timer = Timer.periodic(Duration(milliseconds: 140), (_) {
      setState(() {
        currentPercent++;
        if (currentPercent > 20) {
          activeText2 = Colors.black;
        }
        if (currentPercent > 40) {
          activeText3 = Colors.black;
        }
        if (currentPercent > 60) {
          activeText4 = Colors.black;
        }
        if (currentPercent > 80) {
          activeText5 = Colors.black;
        }

        if (currentPercent == 100) {
          timer?.cancel();
          startTimerToNavigate();
        }
      });
    });
  }

  startTimerToNavigate() {
    var duration = Duration(milliseconds: 1500);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacementNamed(context, "/makingDietDone");
  }

  calculateCaloriesAndMacrosIntake() {
    double BMR;
    int caloriesMain, caloriesIntake, proteinIntake, carbIntake, fatIntake;
    int gender = HoldValues.USER_GENDER;
    int age = HoldValues.USER_AGE;
    int height = HoldValues.USER_HEIGHT;
    double weight = HoldValues.USER_WEIGHT;
    double activityRate = HoldValues.USER_ACTIVITY;
    int goal = HoldValues.USER_GOAL;
    int dietType = HoldValues.USER_DIET_TYPE;
    //Calculate the BMR according to mifflin equation.
    if (gender == 1) {
      BMR = (10 * weight) + (6.25 * height) - (5 * age) + 5;
    } else {
      BMR = (10 * weight) + (6.25 * height) - (5 * age) - 161;
    }
    //Calculate the calories intake;
    caloriesMain = (activityRate * BMR).round();
    if (goal == GAIN_WEIGHT) {
      caloriesIntake = caloriesMain + 300;
    } else if (goal == LOSS_WEIGHT) {
      caloriesIntake = caloriesMain - 500;
    } else {
      caloriesIntake = caloriesMain;
    }

    //Calculate the Macros intake
    //== Get the macros percent accroding to diet type==//
    double proteinPercentage;
    double carbPercentage;
    double fatPercentage;
    if (dietType == BALANCED_DIET) {
      proteinPercentage = BALANCED_PP;
      carbPercentage = BALANCED_CP;
      fatPercentage = BALANCED_FP;
    } else if (dietType == LOW_CARB_DIET) {
      proteinPercentage = LOW_CARB_PP;
      carbPercentage = LOW_CARB_CP;
      fatPercentage = LOW_CARB_FP;
    } else {
      proteinPercentage = KETO_PP;
      carbPercentage = KETO_CP;
      fatPercentage = KETO_FP;
    }
    //==Get what method i well use according to the goal==//
    if (goal == LOSS_WEIGHT) {
      proteinIntake = ((proteinPercentage * caloriesIntake) / 4).round();
      carbIntake = ((carbPercentage * caloriesIntake) / 4).round();
      fatIntake = ((fatPercentage * caloriesIntake) / 9).round();
    } else {
      proteinIntake = (proteinPerWeightNum * weight).round();
      fatIntake = ((fatPercentage * caloriesIntake) / 9).round();
      carbIntake =
          ((caloriesIntake - proteinIntake * 4 - fatIntake * 9) / 4).round();
    }

    //Save in HoldValues.
    HoldValues.USER_CALORIES_MAIN = caloriesMain;
    HoldValues.USER_CALORIES_INTAKE = caloriesIntake;
    HoldValues.USER_PROTEIN_INTAKE = proteinIntake;
    HoldValues.USER_CARB_INTAKE = carbIntake;
    HoldValues.USER_FAT_INTAKE = fatIntake;

    //Treger that the user have diet now.
    HoldValues.USER_HAVE_DIET = true;

    //Save in Database.
    savePrefs(
        caloriesMain, caloriesIntake, proteinIntake, carbIntake, fatIntake);
    //Save in Firebase cloud.
    DatabaseOperations().setUserBodyDataFirebase();

    //print the values for check.
    print("calories intake: $caloriesIntake");
    print("protein intake: $proteinIntake");
    print("carb intake: $carbIntake");
    print("fat intake: $fatIntake");
  }

  savePrefs(int caloriesMain, caloriesIntake, proteinIntake, carbIntake,
      fatIntake) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Treger that the user now have a diet.
    prefs.setBool(KEY_HAVE_DIET, true);
    //Save the diet values.
    prefs.setInt(KEY_CALORIES_MAIN, caloriesMain);
    prefs.setInt(KEY_CALORIES_INTAKE, caloriesIntake);
    prefs.setInt(KEY_PROTEIN_INTAKE, proteinIntake);
    prefs.setInt(KEY_CARB_INTAKE, carbIntake);
    prefs.setInt(KEY_FAT_INTAKE, fatIntake);

    prefs.setInt(KEY_AGE, HoldValues.USER_AGE);
    prefs.setInt(KEY_HEIGHT, HoldValues.USER_HEIGHT);
    prefs.setDouble(KEY_WEIGHT, HoldValues.USER_WEIGHT);
    prefs.setDouble(KEY_ACTIVITY, HoldValues.USER_ACTIVITY);
    prefs.setInt(KEY_GOAL, HoldValues.USER_GOAL);
    prefs.setInt(KEY_DIET_TYPE, HoldValues.USER_DIET_TYPE);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularPercentIndicator(
                animationDuration: 14000,
                animation: true,
                radius: 0.17 * screenWidth,
                lineWidth: 9,
                percent: 1,
                progressColor: Colors.black,
                backgroundColor: Colors.black.withOpacity(0.2),
                circularStrokeCap: CircularStrokeCap.round,
                animateFromLastPercent: true,
                center: Text(
                  "$currentPercent%",
                  style: TextStyle(fontSize: 26),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              AutoSizeText(
                "جاري تحضير برنامجك",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: kSecondaryFont,
                  fontSize: 26,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProcessText(
                    text: "نقوم بعمل تحليل لبياناتك",
                    theTextColor: activeText1,
                  ),
                  ProcessText(
                    text: "جاري حساب احتياجك من السعرات الحرارية",
                    theTextColor: activeText2,
                  ),
                  ProcessText(
                    text: "جاري حساب احتياجك من البروتين",
                    theTextColor: activeText3,
                  ),
                  ProcessText(
                    text: "جاري حساب احتياجك من الكربوهيدرات",
                    theTextColor: activeText4,
                  ),
                  ProcessText(
                    text: "جاري حساب احتياجك من الدهون الصحية",
                    theTextColor: activeText5,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Text displayPercentage() {
    return Text(
      "$currentPercent%",
      style: TextStyle(fontSize: 26),
    );
  }
}

class ProcessText extends StatelessWidget {
  const ProcessText({
    super.key,
    this.text,
    required this.theTextColor,
  });

  final text;
  final Color theTextColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/icons/done_black.png",
            width: 15,
            color: theTextColor,
          ),
          SizedBox(
            width: 5,
          ),
          AutoSizeText(
            text,
            style: TextStyle(
                fontFamily: kPrimaryFont,
                fontSize: 12,
                color: theTextColor,
                fontWeight: FontWeight.bold),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

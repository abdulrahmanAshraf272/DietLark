import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/models/FoodData.dart';
import 'package:food_app/models/ads_test/interstitial_ad_model.dart';
import 'package:food_app/models/calories_and_macros.dart';
import 'package:food_app/models/calories_calculator.dart';
import 'package:food_app/models/food_categories_lists.dart';
import 'package:food_app/screens/mealDetails/meal_details_screen.dart';
import 'package:food_app/screens/myDiet/my_diet_screen.dart';
import 'package:food_app/size_config.dart';
import 'package:food_app/sqldb.dart';
import 'package:sqflite/sqflite.dart';
import 'image_and_bar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:quickalert/quickalert.dart';

class Body extends StatefulWidget {
  Body({
    Key? key,
  }) : super(key: key);
  int calories = 0;
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  //For the animation.
  late AnimationController _animationController;
  bool haveDiet = HoldValues.USER_HAVE_DIET;

  void showAlert() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: "حدث خطأ",
      text: "يجب عليك بناء نظام غذائي لتتمكن من اضافة الاكلات لوجباتك",
      confirmBtnText: "حسنا",
      confirmBtnColor: Colors.black,
    );
  }

  addMethod() async {
    //Check if the textField not empty, and calculate,
    //just in case the user change the value and didn't click on calculate
    if (_amountController.text.isNotEmpty) {
      //Get the value that user write.
      theAmoundSet = _amountController.text;
      int theAmount = int.parse(_amountController.text);
      //Check if the value is acceptable realistic or not.
      if (HoldValues.amountScaleS == gramAmount) {
        if (theAmount > 5000) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("قلل الكمية من فضلك"),
          ));
          //Get out will not complate the operation.
          return;
        }
      } else {
        if (theAmount > 30) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("قلل الكمية من فضلك"),
          ));
          //Get out will not complate the operation.
          return;
        }
      }

      if (haveDiet == false) {
        showAlert();
        return;
      }

      CaloriesAndMacros newValues = CaloriesCalculator().calculateCalories(
          _caloriesAndMacros, int.parse(_amountController.text));

      theAmoundSet = _amountController.text;

      print(newValues.calories);
      //changeTheValue();
      setState(() {
        calories = newValues.calories;
        protein = newValues.protein;
        fat = newValues.fat;
        carb = newValues.carb;
      });

      //// == Add food to my Diet
      if (HoldValues.isAdding == 1) {
        int response = await sqlDb.addFoodToMyDiet(
            HoldValues.foodTitle,
            HoldValues.foodDesc,
            HoldValues.foodImage,
            int.parse(_amountController.text),
            HoldValues.amountScaleS,
            calories,
            protein,
            fat,
            carb,
            HoldValues.mealSelected);
        print(response);

        //Here i must go back to mealDetails-the same meal- and delete
        //all page that after i pressed add button from routeStack.
        if (HoldValues.mealSelected != 0) {
          Navigator.pop(context, 1);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("تم الإضافة"),
          ));
        }

        //Navigator.of(context).popUntil((route) => route.isActive);
      } else {
        //To Edit food amount in my Diet.
        int response = await sqlDb.editFoodAmount(HoldValues.foodId,
            int.parse(_amountController.text), calories, protein, carb, fat);
        print(response);

        Navigator.pop(context, 1);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("أدخل الكمية"),
      ));
    }
    // to see if the process succsess or note , if not it will return 0.
    //if you want to disable back feature set to false
  }

  SqlDb sqlDb = SqlDb();
  final CaloriesAndMacros _caloriesAndMacros = CaloriesAndMacros();

  String amountUnit = "جرام";
  int calories = HoldValues.calories;
  double protein = HoldValues.protein,
      carb = HoldValues.carb,
      fat = HoldValues.fat;
  String theAmoundSet = "";
  /////== To see the Food will be added in which meal ==//////
  int _mealNo = HoldValues.mealSelected;
  /////////////////////////////////////////////////////
  int _isRecipe = 0, _cookingTime = 0, _recipeMealsNo = 0;
  String _prepare = "", _ingredients = "";
  TextEditingController _amountController = TextEditingController();
  @override
  void initState() {
    if (HoldValues.isAdding == 1) {
      _amountController.text = HoldValues.amountScaleS == 1 ? "100" : "1";
      //Display Ad if the user came from notification
      displayAdNotiIsClicked();
    } else {
      //This case if i am editing food in my diet.
      _amountController.text = "${HoldValues.foodAmount}";
    }

    //For the animation.
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    Timer(Duration(milliseconds: 200), () => _animationController.forward());
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    if (HoldValues.isAdding == 1) {
      displayInterstialAdDipose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Save the nutrition value of food in CaloriesAndMacros object for calc.
    //Here i must get the original data from the list.
    Iterable<FoodData> caloriesAndMacrosOriginal =
        allFoodLists.where((element) => element.title == HoldValues.foodTitle);

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenHeightWithoutStateBar =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    //print(caloriesAndMacrosOriginal.first.protein);

    _caloriesAndMacros.calories = caloriesAndMacrosOriginal.first.calories;
    _caloriesAndMacros.protein = caloriesAndMacrosOriginal.first.protein;
    _caloriesAndMacros.fat = caloriesAndMacrosOriginal.first.fat;
    _caloriesAndMacros.carb = caloriesAndMacrosOriginal.first.carb;
    _caloriesAndMacros.amountScale =
        caloriesAndMacrosOriginal.first.amountScale;

    //calories = widget.foodData.calories;

    //Initial value of TextField
    //_amountController.text = widget.foodData.amountScale == 1 ? "100" : "1";

    //To solve the Text field writing number problem
    _amountController.selection = TextSelection.fromPosition(
        TextPosition(offset: _amountController.text.length));

    return SingleChildScrollView(
      child: Container(
        height: screenHeight - 25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenHeight * 0.4,
              child: Stack(
                children: [
                  Hero(
                    tag: 'location2-img-${HoldValues.foodImage}',
                    child: Container(
                      height: screenHeight * 0.4 - 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50)),
                          image: DecorationImage(
                              image: AssetImage(HoldValues.foodImage),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: SlideTransition(
                      position:
                          Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
                              .animate(CurvedAnimation(
                                  parent: _animationController,
                                  curve: Curves.easeInOutCubicEmphasized)),
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          width: screenWidth * 0.9,
                          height: 100,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 5),
                                    blurRadius: 50,
                                    color: Color(0xFF12153D).withOpacity(0.2))
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  topRight: Radius.circular(50))),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      "${calories}\n",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: kPrimaryFont,
                                          fontSize: 26,
                                          color: kRedColor),
                                      maxLines: 1,
                                    ),
                                    Text(
                                      "سعرات",
                                      style: TextStyle(
                                          fontFamily: kPrimaryFont,
                                          fontSize: 12,
                                          color: Colors.black87),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 3, right: 3),
                                width: 1,
                                height: 60,
                                color: Colors.black45,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      "${protein}\n",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: kPrimaryFont,
                                          fontSize: 22,
                                          color: kTextColor2),
                                      maxLines: 1,
                                    ),
                                    Text("بروتين",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: kPrimaryFont,
                                            fontSize: 12,
                                            color: Colors.black87))
                                  ],
                                ),
                              ),
                              SizedBox(width: 3),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      "${fat}\n",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: kPrimaryFont,
                                          fontSize: 22,
                                          color: kTextColor2),
                                      maxLines: 1,
                                    ),
                                    Text("دهون",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: kPrimaryFont,
                                            fontSize: 12,
                                            color: Colors.black87))
                                  ],
                                ),
                              ),
                              SizedBox(width: 3),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      "${carb}\n",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: kPrimaryFont,
                                          fontSize: 22,
                                          color: kTextColor2),
                                      maxLines: 1,
                                    ),
                                    Text("كربوهيدرات",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: kPrimaryFont,
                                            fontSize: 12,
                                            color: Colors.black87))
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  Positioned(
                      right: 0,
                      top: 10,
                      child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(Icons.arrow_back_ios)))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: TitleAndDescription(
                title: HoldValues.foodTitle,
                descriptoin: HoldValues.foodDesc,
              ),
            ),
            Container(
              height: 80,
              width: screenWidth,
              child: Stack(
                children: [
                  Positioned(
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 6,
                                  color: Colors.black26.withOpacity(0.2))
                            ]),
                        child: Container(
                          width: screenWidth,
                          padding: EdgeInsets.only(right: 80, left: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (_amountController.text.isNotEmpty) {
                                    //Get the value that user write.
                                    theAmoundSet = _amountController.text;
                                    int theAmount =
                                        int.parse(_amountController.text);
                                    //Check if the value is acceptable realistic or not.
                                    if (HoldValues.amountScaleS == gramAmount) {
                                      if (theAmount > 5000) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text("قلل الكمية من فضلك"),
                                        ));
                                        //Get out will not complate the operation.
                                        return;
                                      }
                                    } else {
                                      if (theAmount > 30) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text("قلل الكمية من فضلك"),
                                        ));
                                        //Get out will not complate the operation.
                                        return;
                                      }
                                    }

                                    CaloriesAndMacros newValues =
                                        CaloriesCalculator().calculateCalories(
                                            _caloriesAndMacros, theAmount);

                                    print(newValues.calories);
                                    //changeTheValue();
                                    setState(() {
                                      calories = newValues.calories;
                                      protein = newValues.protein;
                                      fat = newValues.fat;
                                      carb = newValues.carb;
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text("أدخل الكمية"),
                                    ));
                                  }
                                },
                                child: Container(
                                  width: screenWidth * 0.20,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFFf3f3f3)),
                                  child: Center(
                                    child: Text(
                                      "أحسب",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontFamily: kPrimaryFont),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: screenWidth * 0.22,
                                height: 33,
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  enableInteractiveSelection: false,
                                  controller: _amountController,
                                  onChanged: (value) {},
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "الكمية",
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: AutoSizeText(
                                  HoldValues.amountScaleS == gramAmount
                                      ? gramString
                                      : HoldValues.amountScaleS == mediumAmount
                                          ? mediumString
                                          : HoldValues.amountScaleS ==
                                                  sponAmount
                                              ? sponString
                                              : cupString,
                                  style: TextStyle(
                                      fontFamily: kPrimaryFont, fontSize: 13),
                                  maxLines: 1,
                                  minFontSize: 8,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                  Positioned(
                    right: 15,
                    top: 5,
                    child: HoldValues.isAdding == 0
                        ? //Here i am going to edit amount of food in meal.
                        SpeedDial(
                            icon: Icons.edit,
                            backgroundColor: Color(0xFF333333),
                            overlayOpacity: 0.3,
                            activeIcon: Icons.close,
                            onPress: () {
                              addMethod();
                            },
                          )
                        : HoldValues.mealSelected !=
                                0 //Here i am going to add food , but i am aready seleted the meal.
                            ? SpeedDial(
                                icon: Icons.add,
                                backgroundColor: Color(0xFF333333),
                                overlayOpacity: 0.3,
                                activeIcon: Icons.close,
                                onPress: () {
                                  addMethod();
                                },
                              )
                            //Here i am going to add food ,but i haven't selected the meal.
                            : SpeedDial(
                                icon: Icons.add,
                                backgroundColor: Color(0xFF333333),
                                overlayOpacity: 0.3,
                                activeIcon: Icons.close,
                                children: [
                                  SpeedDialChild(
                                      label: "اضافة للسناكس",
                                      onTap: () {
                                        HoldValues.mealSelected = 4;
                                        addMethod();
                                        HoldValues.mealSelected = 0;
                                      }),
                                  SpeedDialChild(
                                      label: "اضافة للعشاء",
                                      onTap: () {
                                        HoldValues.mealSelected = 3;
                                        addMethod();
                                        HoldValues.mealSelected = 0;
                                      }),
                                  SpeedDialChild(
                                      label: "اضافة للغداء",
                                      onTap: () {
                                        HoldValues.mealSelected = 2;
                                        addMethod();
                                        HoldValues.mealSelected = 0;
                                      }),
                                  SpeedDialChild(
                                      label: "اضافة للإفطار",
                                      onTap: () {
                                        HoldValues.mealSelected = 1;
                                        addMethod();
                                        HoldValues.mealSelected = 0;
                                      }),
                                ],
                              ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleAndDescription extends StatelessWidget {
  final String title, descriptoin;
  const TitleAndDescription({
    Key? key,
    required this.title,
    required this.descriptoin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontFamily: kPrimaryFont, fontSize: 33),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                descriptoin,
                style: TextStyle(fontFamily: kPrimaryFont, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

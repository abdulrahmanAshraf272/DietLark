import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/screens/make_diet/get_user_data/get_user_data_screen.dart';
import 'package:food_app/screens/mealDetails/meal_details_screen.dart';
import 'package:food_app/screens/meals_time/meals_time_screen.dart';
import 'package:food_app/screens/myDiet/components/macros_progress_bar.dart';
import 'package:food_app/size_config.dart';
import 'package:food_app/sqldb.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:quickalert/quickalert.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  SqlDb sqlDb = SqlDb();
  bool isLoading = true;

  confirmDeletingDiet() async {
    //Deleting data from shared preferences.
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(KEY_HAVE_DIET, false);
    //Reset values in HoldValues variables.
    HoldValues.USER_HAVE_DIET = false;
    print('user have diet = ${HoldValues.USER_HAVE_DIET}');

    //Deleting meals notification from notification.
    await AwesomeNotifications().cancelSchedule(1);
    await AwesomeNotifications().cancelSchedule(2);
    await AwesomeNotifications().cancelSchedule(3);
    await AwesomeNotifications().cancelSchedule(4);
    print('done deleting meals notifications.');

    //Deleting meals notification from shared preferences.
    prefs.setBool(KEY_MEAL1_ACTIVE, false);
    prefs.setBool(KEY_MEAL2_ACTIVE, false);
    prefs.setBool(KEY_MEAL3_ACTIVE, false);
    prefs.setBool(KEY_MEAL4_ACTIVE, false);
    print('done deleting meals notifications from database.');

    int response = await sqlDb.deleteAllMeals();
    print('sqflite database res = $response');

    Navigator.pop(context);
    Navigator.pop(context);
  }

  deleteDietDataCheck() {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.confirm,
        title: "نظام جديد",
        text: "هل تريد حذف بيانات نظامك الغذائي لإنشاء نظام جديد؟",
        confirmBtnText: "حسنا",
        cancelBtnText: "إلغاء",
        confirmBtnColor: Colors.black,
        onConfirmBtnTap: confirmDeletingDiet);
  }

  exceedWarning(
      double caloriesPercent, protainPercent, carbPercent, fatPercent) {
    if (caloriesPercent > 1.04) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.info,
        title: "أنتبه",
        text: "لقد تجاوزت احتياجك اليومي من السعرات الحرارية",
        confirmBtnText: "حسنا",
        confirmBtnColor: Colors.black,
      );
    } else if (proteinPercent > 1.07) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.info,
        title: "أنتبه",
        text: "لقد تجاوزت احتياجك اليومي من البروتين",
        confirmBtnText: "حسنا",
        confirmBtnColor: Colors.black,
      );
    } else if (carbPercent > 1.07) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.info,
        title: "أنتبه",
        text: "لقد تجاوزت احتياجك اليومي من الكربوهيدرات",
        confirmBtnText: "حسنا",
        confirmBtnColor: Colors.black,
      );
    } else if (fatPercent > 1.07) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.info,
        title: "أنتبه",
        text: "لقد تجاوزت احتياجك اليومي من الدهون الصحية",
        confirmBtnText: "حسنا",
        confirmBtnColor: Colors.black,
      );
    }
  }

  /////== to read from the database ==////

  ////// = the Target of calories and macros = //////
  int caloriesTarget = HoldValues.USER_CALORIES_INTAKE,
      proteinTarget = HoldValues.USER_PROTEIN_INTAKE,
      carbTarget = HoldValues.USER_CARB_INTAKE,
      fatTarget = HoldValues.USER_FAT_INTAKE;
  List mealData = [],
      mealData1 = [],
      mealData2 = [],
      mealData3 = [],
      mealData4 = [];
  num caloriesSumAll = 0,
      caloriesSum1 = 0,
      caloriesSum2 = 0,
      caloriesSum3 = 0,
      caloriesSum4 = 0;
  num proteinSumAll = 0,
      proteinSum1 = 0,
      proteinSum2 = 0,
      proteinSum3 = 0,
      proteinSum4 = 0;
  double proteinPercent = 0,
      carbPercent = 0,
      fatPercent = 0,
      caloriesPercent = 0;

  num carbSumAll = 0, carbSum1 = 0, carbSum2 = 0, carbSum3 = 0, carbSum4 = 0;
  num fatSumAll = 0, fatSum1 = 0, fatSum2 = 0, fatSum3 = 0, fatSum4 = 0;

  Future readData() async {
    List<Map> response1 =
        await sqlDb.readData("SELECT * FROM notes WHERE mealNo = 1");
    mealData1.clear();
    mealData1.addAll(response1);

    List<Map> response2 =
        await sqlDb.readData("SELECT * FROM notes WHERE mealNo = 2");
    mealData2.clear();
    mealData2.addAll(response2);

    List<Map> response3 =
        await sqlDb.readData("SELECT * FROM notes WHERE mealNo = 3");
    mealData3.clear();
    mealData3.addAll(response3);

    List<Map> response4 =
        await sqlDb.readData("SELECT * FROM notes WHERE mealNo = 4");
    mealData4.clear();
    mealData4.addAll(response4);

    ////= Calculate the Calories and macros sum =////
    caloriesSumAll = 0;
    caloriesSum1 = 0;
    caloriesSum2 = 0;
    caloriesSum3 = 0;
    caloriesSum4 = 0;
    proteinSumAll = 0;
    proteinSum1 = 0;
    proteinSum2 = 0;
    proteinSum3 = 0;
    proteinSum4 = 0;
    carbSum1 = 0;
    carbSum2 = 0;
    carbSum3 = 0;
    carbSum4 = 0;
    carbSumAll = 0;
    fatSum1 = 0;
    fatSum2 = 0;
    fatSum3 = 0;
    fatSum4 = 0;
    fatSumAll = 0;

    for (int i = 0; i < mealData1.length; i++) {
      caloriesSum1 += mealData1[i]['calories'];
      proteinSum1 += mealData1[i]['protein'];
      carbSum1 += mealData1[i]['carb'];
      fatSum1 += mealData1[i]['fat'];
    }
    for (int i = 0; i < mealData2.length; i++) {
      caloriesSum2 += mealData2[i]['calories'];
      proteinSum2 += mealData2[i]['protein'];
      carbSum2 += mealData2[i]['carb'];
      fatSum2 += mealData2[i]['fat'];
    }
    for (int i = 0; i < mealData3.length; i++) {
      caloriesSum3 += mealData3[i]['calories'];
      proteinSum3 += mealData3[i]['protein'];
      carbSum3 += mealData3[i]['carb'];
      fatSum3 += mealData3[i]['fat'];
    }
    for (int i = 0; i < mealData4.length; i++) {
      caloriesSum4 += mealData4[i]['calories'];
      proteinSum4 += mealData4[i]['protein'];
      carbSum4 += mealData4[i]['carb'];
      fatSum4 += mealData4[i]['fat'];
    }

    caloriesSumAll = caloriesSum1 + caloriesSum2 + caloriesSum3 + caloriesSum4;
    proteinSumAll = proteinSum1 + proteinSum2 + proteinSum3 + proteinSum4;
    carbSumAll = carbSum1 + carbSum2 + carbSum3 + carbSum4;
    fatSumAll = fatSum1 + fatSum2 + fatSum3 + fatSum4;
    HoldValues.stopCalc = 0;
    //calculate the percentage.
    proteinPercent = proteinSumAll / proteinTarget;
    carbPercent = carbSumAll / carbTarget;
    fatPercent = fatSumAll / fatTarget;
    caloriesPercent = caloriesSumAll / caloriesTarget;

    isLoading = false;
    if (this.mounted) {
      setState(() {});
    }
  }

  //

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Color circleColor = Color(0xFF263725);
  Color backgroundColor = Color(0xFF334632);

  @override
  Widget build(BuildContext context) {
    //readData();
    setState(() {
      readData();
    });

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double circleWidth = screenHeight * 0.276;
    double indicatorRadius = screenHeight * 0.112;
    double bigLineLength = 8;
    double smallLineLenth = 4;
    double smallCenterInBig = (bigLineLength - smallLineLenth) / 2;

    return Column(
      children: [
        Container(
          height: screenHeight * 0.50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 3),
                    blurRadius: 6,
                    color: Colors.black.withOpacity(0.5))
              ],
              color: Color(0xFF334632),
              gradient: LinearGradient(
                  colors: [Color(0xFF5a624d), Color(0xFF334632)],
                  begin: Alignment.topRight,
                  end: Alignment.center)),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 50,
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white.withOpacity(0.6),
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: deleteDietDataCheck,
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 50,
                            child: Icon(
                              Icons.delete,
                              color: Colors.white.withOpacity(0.6),
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                    width: circleWidth,
                    height: circleWidth,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFF263725)),
                    child: Stack(children: [
                      Positioned.fill(
                        child: CircularPercentIndicator(
                          arcType: ArcType.FULL,
                          startAngle: 240,
                          radius: indicatorRadius,
                          lineWidth: smallLineLenth,
                          percent: 1,
                          progressColor: Color(0xFF737d74),
                          backgroundColor: Color(0xFF6f7b6f),
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                      ),
                      Positioned.fill(
                        child: CircularPercentIndicator(
                          arcType: ArcType.FULL,
                          curve: Curves.easeInOutCirc,
                          startAngle: 240,
                          animationDuration: 2000,
                          animation: true,
                          radius: indicatorRadius + smallCenterInBig,
                          lineWidth: bigLineLength,
                          animateFromLastPercent: true,
                          percent: caloriesPercent < 1 ? caloriesPercent : 1,
                          progressColor: Color(0xFFffc13d),
                          backgroundColor: Color(0xFF6f7b6f),
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Container(
                            width: indicatorRadius = screenWidth * 0.29,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  "$caloriesSumAll",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFfcfffa)),
                                  maxLines: 1,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                AutoSizeText(
                                  "احتياجك اليومي $caloriesTarget",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      //fontFamily: kPrimaryFont,
                                      color: Color(0xFF859384)),
                                  maxLines: 2,
                                ),
                                Text(
                                  "سعرة حرارية",
                                  style: TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                      //fontFamily: kPrimaryFont,
                                      color: Color(0xFF859384)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 0,
                        left: 0,
                        child: GestureDetector(
                          onTap: () => exceedWarning(caloriesPercent,
                              proteinPercent, carbPercent, fatPercent),
                          child: caloriesPercent > 1.04 ||
                                  proteinPercent > 1.07 ||
                                  carbPercent > 1.07 ||
                                  fatPercent > 1.07
                              ? Container(
                                  height: 20,
                                  width: 20,
                                  child: Lottie.asset(
                                    'assets/icons/warning2.json',
                                  ),
                                )
                              : SizedBox(),
                        ),
                      ),
                    ])),

                ///////== MacrosBar == ///////
                SizedBox(
                  height: 15,
                ),
                MacrosProgressLine(
                    proteinPercent: proteinPercent,
                    proteinSumAll: proteinSumAll,
                    proteinTarget: proteinTarget,
                    carbPercent: carbPercent,
                    carbSumAll: carbSumAll,
                    carbTarget: carbTarget,
                    fatPercent: fatPercent,
                    fatSumAll: fatSumAll,
                    fatTarget: fatTarget)
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                MealCard(
                  mealData: mealData1,
                  mealNumber: 1,
                  caloriesSum: caloriesSum1.toInt(),
                ),
                MealCard(
                  mealData: mealData2,
                  mealNumber: 2,
                  caloriesSum: caloriesSum2.toInt(),
                ),
                MealCard(
                  mealData: mealData3,
                  mealNumber: 3,
                  caloriesSum: caloriesSum3.toInt(),
                ),
                MealCard(
                  mealData: mealData4,
                  mealNumber: 4,
                  caloriesSum: caloriesSum4.toInt(),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MealCard extends StatelessWidget {
  const MealCard({
    Key? key,
    required this.mealData,
    required this.mealNumber,
    required this.caloriesSum,
  }) : super(key: key);

  final List mealData;
  final int mealNumber;
  final int caloriesSum;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(bottom: 12, right: 15),
      width: screenWidth - 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xff333333).withOpacity(0.5))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                ),
                child: Text(
                  mealNumber == 1
                      ? "وجبة الإفطار: $caloriesSum"
                      : mealNumber == 2
                          ? "وجبة الغداء: $caloriesSum"
                          : mealNumber == 3
                              ? "وجبة العشاء: $caloriesSum"
                              : "سناكس: $caloriesSum",
                  style: TextStyle(
                      fontFamily: kSecondaryFont,
                      fontSize: 18,
                      color: Color(0xff333333)),
                ),
              ),
              Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MealsTime()));
                      HoldValues.mealSelected = mealNumber;
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 50,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Icon(
                        Icons.alarm,
                        color: Colors.black.withOpacity(0.6),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 60 * mealData.length.toDouble(),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                children: [
                  ListView.builder(
                      itemCount: mealData.length,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      //physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ItemListMealCard(
                            title: "${mealData[index]['name']}",
                            amount:
                                "${mealData[index]['amount']} ${HoldValues.amountFormMethod(mealData[index]['amountType'])}",
                            image: "${mealData[index]['image']}",
                            calories: "${mealData[index]['calories']}",
                          )),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Container(
                height: 35,
                width: 75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xfff3f3f3)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        HoldValues.mealSelected = mealNumber;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MealDetails()));

                        ////== It will racieve 1 if i return to this page , to Refresh the database== ////
                      },
                      child: Container(
                        height: 35,
                        width: 75,
                        child: Center(
                          child: Text(
                            "اضافة",
                            style: TextStyle(
                                fontFamily: kPrimaryFont,
                                color: Colors.black,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ItemListMealCard extends StatelessWidget {
  const ItemListMealCard({
    Key? key,
    this.title,
    this.amount,
    this.image,
    this.calories,
  }) : super(key: key);

  final title, amount, image, calories;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: 60,
      child: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  image: AssetImage(image),
                ),
                borderRadius: BorderRadius.circular(15)),
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: screenWidth * 0.48,
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: kPrimaryFont,
                    fontSize: 18,
                  ),
                ),
              ),
              //SizedBox(height: 5),
              Text(
                amount,
                style: TextStyle(
                    fontFamily: kPrimaryFont,
                    fontSize: 12,
                    color: Colors.black38),
              ),
            ],
          ),
          Spacer(),
          Text(
            calories,
            style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

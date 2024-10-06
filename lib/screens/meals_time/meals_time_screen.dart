import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/screens/meals_time/pick_time_screen.dart';
import 'package:food_app/utilities.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:numberpicker/numberpicker.dart';

int mealNo = 1;

class MealsTime extends StatelessWidget {
  MealsTime({super.key});

  @override
  Widget build(BuildContext context) {
    mealNo = HoldValues.mealSelected;
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    // TODO: implement initState
    mealNo = HoldValues.mealSelected;
    getMealTime(mealNo);
    super.initState();
  }

  bool somethingChanged = false;

  String mealName = mealNo == 1
      ? "وقت الإفطار"
      : mealNo == 2
          ? "وقت الغداء"
          : mealNo == 3
              ? "وقت العشاء"
              : "وقت الإسناكس";

  bool mealActive = false;
  String mealTime = "غير محدد";
  int mealHour = 9;
  int mealMin = 30;

  //TimeOfDay _startTime = TimeOfDay(hour: int.parse(s.split(":")[0]), minute: int.parse(s.split(":")[1]));

  getMealTime(int mealNo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (mealNo == 1) {
      mealActive = prefs.getBool(KEY_MEAL1_ACTIVE)!;
      if (mealActive) {
        mealHour = prefs.getInt(KEY_MEAL1_HOUR)!;
        mealMin = prefs.getInt(KEY_MEAL1_MIN)!;
      }
    } else if (mealNo == 2) {
      mealActive = prefs.getBool(KEY_MEAL2_ACTIVE)!;
      if (mealActive) {
        mealHour = prefs.getInt(KEY_MEAL2_HOUR)!;
        mealMin = prefs.getInt(KEY_MEAL2_MIN)!;
      }
    } else if (mealNo == 3) {
      mealActive = prefs.getBool(KEY_MEAL3_ACTIVE)!;
      if (mealActive) {
        mealHour = prefs.getInt(KEY_MEAL3_HOUR)!;
        mealMin = prefs.getInt(KEY_MEAL3_MIN)!;
      }
    } else {
      mealActive = prefs.getBool(KEY_MEAL4_ACTIVE)!;
      if (mealActive) {
        mealHour = prefs.getInt(KEY_MEAL4_HOUR)!;
        mealMin = prefs.getInt(KEY_MEAL4_MIN)!;
      }
    }

    if (mealActive) {
      setState(() {
        mealTime =
            " ${mealHour.toString().padLeft(2, '0')}:${mealMin.toString().padLeft(2, '0')}";
      });

      print(mealTime);
    }
  }

  Future<void> cancelScheduleNotification() async {
    await AwesomeNotifications().cancelSchedule(mealNo);
    //Remove meal time from database.
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (mealNo == 1) {
      prefs.setBool(KEY_MEAL1_ACTIVE, false);
    } else if (mealNo == 2) {
      prefs.setBool(KEY_MEAL2_ACTIVE, false);
    } else if (mealNo == 3) {
      prefs.setBool(KEY_MEAL3_ACTIVE, false);
    } else {
      prefs.setBool(KEY_MEAL4_ACTIVE, false);
    }
    setState(() {
      mealTime = "غير محدد";
      mealActive = false;
      print("notification canceled");
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            //height: 35,
            width: screenWidth,
            color: Color(0xFF334632),
            child: SafeArea(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 21,
                    )),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    mealNo == 1
                        ? "وقت الإفطار"
                        : mealNo == 2
                            ? "وقت الغداء"
                            : mealNo == 3
                                ? "وقت العشاء"
                                : "وقت الإسناكس",
                    style: TextStyle(
                        fontFamily: kPrimaryFont,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      if (mealActive) {
                        cancelScheduleNotification();
                        setState(() {});
                      }
                    },
                    child: Text(
                      "حذف",
                      style: TextStyle(
                          fontFamily: kPrimaryFont,
                          color: mealActive ? Colors.white : Color(0xFF334632)),
                    ))
              ],
            )),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            mealTime,
            style: TextStyle(fontSize: 35, fontFamily: kPrimaryFont),
          ),
          Spacer(),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 15, top: 10, right: 20, left: 20),
            child: Container(
              width: screenWidth,
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xFF212121),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () async {
                      //_showTimePicker();
                      //somethingChanged = true;
                      //setState(() {});
                      HoldValues.MEAL_HOUR = mealHour;
                      HoldValues.MEAL_MIN = mealMin;
                      int done = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PickTime()));
                      if (done == 1) {
                        setState(() {
                          mealHour = HoldValues.MEAL_HOUR;
                          mealMin = HoldValues.MEAL_MIN;
                          mealTime =
                              " ${mealHour.toString().padLeft(2, '0')}:${mealMin.toString().padLeft(2, '0')}";
                          mealActive = true;
                        });
                      }
                    },
                    child: Container(
                      width: screenWidth,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: 60,
                      alignment: Alignment.center,
                      child: Text(
                        mealActive ? "تعديل" : "إضافة",
                        style: TextStyle(
                            fontFamily: kPrimaryFont,
                            color: Colors.white,
                            fontSize: 16),
                        textAlign: TextAlign.center,
                        maxLines: 1,
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

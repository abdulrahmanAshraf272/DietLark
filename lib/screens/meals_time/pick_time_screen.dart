import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PickTime extends StatelessWidget {
  const PickTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black.withOpacity(0.9),
              size: 21,
            )),
      ),
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
  int hour = HoldValues.MEAL_HOUR;
  int min = HoldValues.MEAL_MIN;
  int mealNo = HoldValues.mealSelected;
  String mealName = "وقت الإفطار";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mealNo == 1) {
      mealName = "وقت الإفطار";
    } else if (mealNo == 2) {
      mealName = "وقت الغداء";
    } else if (mealNo == 3) {
      mealName = "وقت العشاء";
    } else {
      mealName = "وقت الإسناكس";
    }
  }

  Future<void> createMealsTimeNotifications() async {
    await AwesomeNotifications().cancelSchedule(mealNo);

    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: mealNo,
          channelKey: 'basic_channel',
          title: '$mealName ${Emojis.smile_face_savoring_food}',
          body: 'انقر لمعرفة محتوى الوجبة وقيمتها الغذائية.',
        ),
        schedule: NotificationCalendar(
            hour: hour, minute: min, second: 0, millisecond: 0, repeats: true));
    print("notification created");

    saveMealTime(mealNo, hour, min);
  }

  saveMealTime(int mealNo, int mealHour, int mealMin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (mealNo == 1) {
      prefs.setBool(KEY_MEAL1_ACTIVE, true);
      prefs.setInt(KEY_MEAL1_HOUR, mealHour);
      prefs.setInt(KEY_MEAL1_MIN, mealMin);
    } else if (mealNo == 2) {
      prefs.setBool(KEY_MEAL2_ACTIVE, true);
      prefs.setInt(KEY_MEAL2_HOUR, mealHour);
      prefs.setInt(KEY_MEAL2_MIN, mealMin);
    } else if (mealNo == 3) {
      prefs.setBool(KEY_MEAL3_ACTIVE, true);
      prefs.setInt(KEY_MEAL3_HOUR, mealHour);
      prefs.setInt(KEY_MEAL3_MIN, mealMin);
    } else {
      prefs.setBool(KEY_MEAL4_ACTIVE, true);
      prefs.setInt(KEY_MEAL4_HOUR, mealHour);
      prefs.setInt(KEY_MEAL4_MIN, mealMin);
    }
    print("notification saved");
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "وقت التنبيه! ${hour.toString().padLeft(2, '0')}:${min.toString().padLeft(2, '0')}",
              style: TextStyle(fontSize: 20, fontFamily: kPrimaryFont),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [kDefaultShadow]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "الدقيقة",
                        style: TextStyle(
                            fontFamily: kPrimaryFont,
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 13),
                      ),
                      NumberPicker(
                        minValue: 0,
                        maxValue: 59,
                        zeroPad: true,
                        infiniteLoop: true,
                        itemWidth: 80,
                        itemHeight: 60,
                        value: min,
                        onChanged: (value) {
                          setState(() {
                            min = value;
                          });
                        },
                        textStyle: TextStyle(
                            color: Colors.white.withOpacity(0.6), fontSize: 20),
                        selectedTextStyle:
                            TextStyle(color: Colors.white, fontSize: 30),
                        decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Colors.white),
                              bottom: BorderSide(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: Text(
                      ":",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "الساعة",
                        style: TextStyle(
                            fontFamily: kPrimaryFont,
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 13),
                      ),
                      NumberPicker(
                        minValue: 0,
                        maxValue: 23,
                        zeroPad: true,
                        infiniteLoop: true,
                        itemWidth: 80,
                        itemHeight: 60,
                        value: hour,
                        onChanged: (value) {
                          setState(() {
                            hour = value;
                          });
                        },
                        textStyle: TextStyle(
                            color: Colors.white.withOpacity(0.6), fontSize: 20),
                        selectedTextStyle:
                            TextStyle(color: Colors.white, fontSize: 30),
                        decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Colors.white),
                              bottom: BorderSide(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 15, top: 10, right: 20, left: 20),
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
                      onTap: () {
                        createMealsTimeNotifications();
                        HoldValues.MEAL_HOUR = hour;
                        HoldValues.MEAL_MIN = min;
                        Navigator.pop(context, 1);
                      },
                      child: Container(
                        width: screenWidth,
                        padding: EdgeInsets.only(left: 20, right: 20),
                        height: 60,
                        alignment: Alignment.center,
                        child: Text(
                          "حفظ",
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
      ),
    );
  }
}

import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:lottie/lottie.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class RateApp extends StatelessWidget {
  const RateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.close,
              color: Colors.black.withOpacity(0.8),
            )),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  rateAppFunction1() async {
    final InAppReview inAppReview = InAppReview.instance;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      HoldValues.RATE_COUNTER = 5; //random number not 1 or 2 or 3
      prefs.setInt(KEY_RATE_COUNTER, 5);

      bool available = await inAppReview.isAvailable();
      print(available);
      if (available) {
        inAppReview.requestReview();
      }
    } catch (e) {
      print(e);
    }
  }

  rateAppFunction2() async {
    final InAppReview inAppReview = InAppReview.instance;
    try {
      bool available = await inAppReview.isAvailable();
      print(available);
      if (available) {
        inAppReview.requestReview();
      } else {
        print('open app store');
        inAppReview.openStoreListing(
            appStoreId: 'com.dietlark.fitness.calorie.loseweight');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> rateAppFunction3() async {
    String appAddress =
        'https://play.google.com/store/apps/details?id=com.dietlark.fitness.calorie.loseweight';
    if (await canLaunch(appAddress)) {
      await launch(appAddress);
    } else {
      print('open app address failded');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rateAppFunction1();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight,
      width: screenWidth,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'رأيك يهمنا',
              style: TextStyle(fontFamily: kFontDGSahabah, fontSize: 32),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Lottie.asset('assets/icons/rateApp.json'),
            ),
            Text(
              'تقييمك و ابداء رأيك عن التطبيق سيُساعدنا',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: kPrimaryFont, fontSize: 18),
            ),
            Text('لتطوير التطبيق وتقديم خدمات اكثر ${Emojis.emotion_red_heart}',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: kPrimaryFont, fontSize: 18)),
            Spacer(),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: ElevatedButton(
                  onPressed: () {
                    rateAppFunction3();
                  },
                  child: Text(
                    'تقييم التطبيق',
                    style: TextStyle(
                        fontFamily: kPrimaryFont,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith((state) {
                        if (state.contains(MaterialState.pressed)) {
                          return Colors.black87.withOpacity(0.9);
                        }
                        return Colors.black87;
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)))),
                ))
          ],
        ),
      ),
    );
  }
}

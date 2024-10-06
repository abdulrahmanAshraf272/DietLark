import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/screens/home/home_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ShareDone extends StatelessWidget {
  const ShareDone({super.key});

  @override
  Widget build(BuildContext context) {
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
  String animationImage = 'assets/images/loading.json';
  String title = "برجاء الإنتظار";
  bool rep = true;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 5), (_) {
      setState(() {
        animationImage = 'assets/icons/done_animation1.json';
        rep = false;
        title = "تم تفعيل حسابك";
      });
    });
  }

  activePremiume() async {
    //Change to premium in shared preferences.
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(KEY_PREMIUM, 1);
    print('changed to premium in shared preferences.');
    //Change to premium in HoldValues file.
    HoldValues.PREMIUM_ACCOUNT = 1;

    // ==== Set values in Firebase cloud ==== //
    final db = await FirebaseFirestore.instance;
    final user = await FirebaseAuth.instance.currentUser;
    //Change to premium in firebase cloud.
    if (user != null) {
      final userInfo = {
        KEY_PREMIUM: 1,
      };
      db
          .collection('users')
          .doc(user.uid)
          .set(userInfo, SetOptions(merge: true))
          .onError((e, _) => print("Error writing document: $e"));
      print('changed to premium in firebase cloud');
    } else {
      print('no account id');
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    activePremiume();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        height: screenHeight,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Container(
                  width: screenWidth * 0.6,
                  child: Lottie.asset(animationImage, repeat: true)),
              SizedBox(height: 0),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: kSecondaryFont,
                  fontSize: 26,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                rep ? "" : "شكرا لك",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: kSecondaryFont,
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                rep ? "" : "استمتع الان بالنسخة الكاملة ولمدة 6 اشهر",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: kPrimaryFont,
                  fontSize: 16,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () async {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                      (r) => false);
                },
                child: Container(
                  width: screenWidth,
                  alignment: Alignment.center,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFF212121),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "ابدأ",
                    style: TextStyle(
                        fontFamily: kPrimaryFont,
                        color: Colors.white,
                        fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/database_operations.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/notifications.dart';
import 'package:food_app/screens/home/home_screen.dart';
import 'package:food_app/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    var duration = Duration(seconds: 4);
    return Timer(duration, route);
  }

  Future<bool> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print('internet connection :true');
      return false;
    } else {
      print('internet connection = false');
      return true;
    }
  }

  route() {
    if (HoldValues.firstTime == true) {
      Navigator.pushReplacementNamed(context, "/welcome");
    } else {
      Navigator.pushReplacementNamed(context, "/home");
    }
  }

  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    if (await checkInternet()) {
      DatabaseOperations().getUserInfoFromSharedPref();
      startTimer();
    } else {
      Navigator.pushReplacementNamed(context, '/noInternet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1e3d59),
      body: content(),
    );
  }

  Widget content() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/splash_image.png"),
        fit: BoxFit.fill,
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Center(
            child: Image.asset(
          "assets/images/splash_logo4.png",
        )),
      ),
    );
  }
}

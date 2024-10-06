import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/screens/splash_page/splash_page_screen.dart';
import 'package:lottie/lottie.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      backgroundColor: Colors.black87,
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight,
      width: screenWidth,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Lottie.asset(
                "assets/icons/noInternetIcon.json",
              ),
            ),
            Text(
              'لا يوجد اتصال بالإنترنت',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: kPrimaryFont,
                  fontSize: 26,
                  color: Colors.white.withOpacity(0.8)),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'قم بالإتصال بالإنترنت ثم اضغط على تحديث',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: kPrimaryFont,
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.7)),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                bool isConnected = await HoldValues().checkInternetConnection();
                if (isConnected) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SplashScreen()));
                }
              },
              child: Text(
                'تحديث',
                style: TextStyle(
                    fontFamily: kPrimaryFont,
                    fontSize: 16,
                    color: Colors.black87),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((state) {
                    if (state.contains(MaterialState.pressed)) {
                      return Colors.white.withOpacity(0.1);
                    }
                    return Colors.white.withOpacity(0.2);
                  }),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
            )
          ],
        ),
      ),
    );
  }
}

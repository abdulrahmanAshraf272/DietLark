import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';

import 'package:food_app/screens/just_downloaded/name_gender/get_name_gender.dart';
import 'package:food_app/screens/user_account/login/login_screen.dart';
import 'package:food_app/screens/user_account/reusable_text_field.dart';
import 'package:food_app/screens/user_account/sign_up/sign_up_screen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1e3d59),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/welcomePage5.jpg"),
            alignment: Alignment.centerRight,
            fit: BoxFit.fitHeight,
            opacity: 0.5),
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 25, right: 15, left: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "مرحبا بك",
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: kFontDGSahabah,
                  color: firstColorPackage2),
            ),
            Row(
              children: [
                Text(
                  "في ietLark",
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: kFontDGSahabah,
                      color: firstColorPackage2),
                  maxLines: 2,
                ),
                Container(
                    margin: EdgeInsets.only(right: 1, bottom: 0),
                    child: Image.asset(
                      "assets/icons/Logo2.png",
                      width: 36,
                      height: 36,
                    ))
              ],
            ),
            AutoSizeText(
              "تطبيق التغذية رقم 1 في الوطن العربي\nودليلك الشامل للقيم الغذائية للأطعمة وانواع الدايت المختلفة.",
              style: TextStyle(
                  fontFamily: kPrimaryFont,
                  fontSize: 15,
                  color: firstColorPackage2.withOpacity(0.6)),
            ),
            SizedBox(
              height: 60,
            ),
            
            signInSignUpButton(context, false,(){Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SignUpPage()));}),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "لديك حساب بالفعل؟ ",
                  style: TextStyle(
                      fontFamily: kPrimaryFont,
                      color: firstColorPackage2,
                      fontSize: 13),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage())),
                  child: Text("تسجيل دخول",
                      style: TextStyle(
                          fontFamily: kPrimaryFont,
                          color: firstColorPackage2,
                          fontSize: 13)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

/* 


            GestureDetector(
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => GetNameGendar())),
              child: Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "ابدأ الان",
                  style: TextStyle(
                      fontFamily: kPrimaryFont, color: firstColorPackage1),
                ),
              ),
            )
*/

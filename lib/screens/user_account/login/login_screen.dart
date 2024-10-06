import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/database_operations.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/models/images_source.dart';
import 'package:food_app/screens/home/home_screen.dart';
import 'package:food_app/screens/user_account/account_operations.dart';
import 'package:food_app/screens/user_account/reusable_text_field.dart';
import 'package:food_app/screens/user_account/sign_up/sign_up_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:connectivity/connectivity.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      backgroundColor: oldSplashColor,
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  bool isPasswordVisible = false;

  Timer? _timer;
  late double _progress;

  //Login to my account using email
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });

    // EasyLoading.removeCallbacks();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/welcomePage5.jpg"),
              alignment: Alignment.centerRight,
              fit: BoxFit.fitHeight,
              opacity: 0.3),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                'تسجيل دخول',
                style: TextStyle(
                    fontFamily: kSecondaryFont,
                    fontSize: 22,
                    color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              reusableTextField('ادخل البريد الالكتروني', Icons.person_outline,
                  false, _emailTextController),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _passwordTextController,
                obscureText: !isPasswordVisible,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white, fontFamily: kPrimaryFont),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.white70,
                    ),
                    labelText: 'ادخل كلمة السر',
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white70,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    )),
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 40),
              Text(
                '________________   او   ________________ ',
                style: TextStyle(color: Colors.white.withOpacity(0.6)),
              ),
              SizedBox(
                height: 10,
              ),
              Text('تسجيل دخول من خلال',
                  style: TextStyle(color: Colors.white.withOpacity(0.6))),
              SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () async {
                    //create account and login by the same function.
                    await UserAccountOperations().loginByGoogle(context);
                  },
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(6)),
                      child: SvgPicture.asset('assets/icons/google_svg.svg'))),
              Spacer(),
              signInSignUpButton(context, true, () async {
                await UserAccountOperations().loginByEmail(context,
                    _emailTextController.text, _passwordTextController.text);
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ليس لديك حساب؟ ',
                    style: TextStyle(
                        fontFamily: kPrimaryFont,
                        color: firstColorPackage2,
                        fontSize: 13),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignUpPage())),
                    child: Text("إنشاء حساب",
                        style: TextStyle(
                            fontFamily: kPrimaryFont,
                            color: firstColorPackage2,
                            fontSize: 13)),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'لا تمتلك حساب؟ ',
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUpPage()));
          },
          child: Text(
            'إنشاء حساب',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

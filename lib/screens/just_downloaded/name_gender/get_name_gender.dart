import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/database_operations.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:quickalert/quickalert.dart';

class GetNameGendar extends StatelessWidget {
  const GetNameGendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1e3d59),
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
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _secondNameController = TextEditingController();
  int theGender = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/welcomePage5.jpg"),
              alignment: Alignment.centerRight,
              fit: BoxFit.fitHeight,
              opacity: 0.3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    "الاسم الاول",
                    style: TextStyle(
                        fontFamily: kPrimaryFont,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 2, bottom: 2, right: 10, left: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  controller: _firstNameController,
                  style:
                      TextStyle(color: Colors.white, fontFamily: kPrimaryFont),
                  decoration: InputDecoration(
                      hintText: "الاسم بالغة العربية",
                      border: InputBorder.none,

                      //border: InputBorder.none,
                      hintStyle: TextStyle(
                          fontFamily: kPrimaryFont,
                          color: Colors.white.withOpacity(0.3))),
                ),
              ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    "اسم العائلة",
                    style: TextStyle(
                        fontFamily: kPrimaryFont,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 2, bottom: 2, right: 10, left: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  controller: _secondNameController,
                  style:
                      TextStyle(color: Colors.white, fontFamily: kPrimaryFont),
                  decoration: InputDecoration(
                      hintText: "الاسم بالغة العربية",
                      border: InputBorder.none,
                      //border: InputBorder.none,
                      hintStyle: TextStyle(
                          fontFamily: kPrimaryFont,
                          color: Colors.white.withOpacity(0.3))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "النوع؟",
                style: TextStyle(
                    fontFamily: kFontDGSahabah,
                    fontSize: 20,
                    color: Colors.white.withOpacity(0.9)),
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        theGender = 1;
                      });
                    },
                    child: Container(
                      height: screenWidth * 0.30,
                      width: screenWidth * 0.30,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: firstColorPackage1.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10)
                          ],
                          border: Border.all(
                              color: theGender == 1
                                  ? Colors.white
                                  : Colors.transparent)),
                      child: GenderIcon(
                        gender: 1,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        theGender = 2;
                      });
                    },
                    child: Container(
                      height: screenWidth * 0.30,
                      width: screenWidth * 0.30,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: firstColorPackage1.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10)
                          ],
                          border: Border.all(
                              color: theGender == 2
                                  ? Colors.white
                                  : Colors.transparent)),
                      child: GenderIcon(gender: 2),
                    ),
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  //Check first name is not empty.
                  if (_firstNameController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("ادخل الاسم الاول"),
                    ));
                    return;
                  }
                  //Check second name is note empty.
                  if (_secondNameController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("ادخل اسم العائلة"),
                    ));
                    return;
                  }
                  //Check he selected the gender.
                  if (theGender == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("اختر النوع"),
                    ));
                    return;
                  }

                  if (HoldValues.isSignUpOperation) {
                    //Save user data in holdVaues , SharedPreferences and Firebase.
                    DatabaseOperations().signUpSetValues(
                        _firstNameController.text.trim(),
                        _secondNameController.text.trim(),
                        theGender);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  } else {
                    DatabaseOperations().editUserInfo(
                        _firstNameController.text.trim(),
                        _secondNameController.text.trim(),
                        theGender);
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  height: 50,
                  width: screenWidth,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    HoldValues.isSignUpOperation ? "ابدأ الان" : 'تعديل',
                    style: TextStyle(
                        fontFamily: kPrimaryFont, color: Colors.black),
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

class GenderIcon extends StatelessWidget {
  const GenderIcon({
    super.key,
    required this.gender,
  });

  final int gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(gender == 1
                        ? "assets/icons/man_icon.png"
                        : "assets/icons/woman_icon.png"))),
          ),
        ),
        Text(
          gender == 1 ? "ذكر" : "أنثى",
          style: TextStyle(fontFamily: kSecondaryFont, fontSize: 14),
        )
      ],
    );
  }
}

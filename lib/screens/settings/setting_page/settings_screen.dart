import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/screens/settings/edit_diet/edti_diet_screen.dart';
import 'package:food_app/screens/settings/setting_page/app_language/app_language_screen.dart';
import 'package:food_app/screens/settings/setting_page/myAccount/myAccount_screen.dart';
import 'package:food_app/screens/suggestions/suggestions_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'الاعدادات',
          style: TextStyle(
              fontFamily: kPrimaryFont, fontSize: 18, color: Colors.black87),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
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
  late String _firstName;
  late String _secondName;
  getFirstAndSecondName() {
    _firstName = HoldValues.USER_FIRST_NAME;
    _secondName = HoldValues.USER_SECOND_NAME;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFirstAndSecondName();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Color cardColor = Color(0xFFf4f4f4);

    return Container(
      height: screenHeight,
      width: screenWidth,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: SizedBox(
                height: 15,
              ),
            ),
            Container(
              color: cardColor,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => myAccount()))
                      .then((value) => setState(() {
                            print('try refresh');
                          })),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$_firstName $_secondName',
                              style: TextStyle(
                                  fontFamily: kPrimaryFont,
                                  color: Colors.black87,
                                  fontSize: 16),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              HoldValues.USER_ACCOUNT,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.7)),
                            )
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black.withOpacity(0.7),
                          size: 23,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: cardColor,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                    child: Row(
                      children: [
                        Lottie.asset(
                          "assets/icons/gold.json",
                          height: 45,
                        ),
                        Text('Premium'),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black.withOpacity(0.7),
                          size: 23,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: cardColor,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                            MaterialPageRoute(builder: (context) => EditDiet()))
                        .then((value) => setState(() {
                              print('try refresh');
                            }));
                    ;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Row(
                      children: [
                        Text(
                          'النظام الغذائي',
                          style: TextStyle(
                              fontFamily: kPrimaryFont,
                              color: Colors.black87,
                              fontSize: 16),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black.withOpacity(0.7),
                          size: 23,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: cardColor,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AppLanguage())),
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      child: Row(
                        children: [
                          Text(
                            'اللغة',
                            style: TextStyle(
                                fontFamily: kPrimaryFont,
                                color: Colors.black87,
                                fontSize: 16),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black.withOpacity(0.7),
                            size: 23,
                          )
                        ],
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: cardColor,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SuggestionsPage())),
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      child: Row(
                        children: [
                          Text(
                            'الشكاوى و الاقتراحات',
                            style: TextStyle(
                                fontFamily: kPrimaryFont,
                                color: Colors.black87,
                                fontSize: 16),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black.withOpacity(0.7),
                            size: 23,
                          )
                        ],
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

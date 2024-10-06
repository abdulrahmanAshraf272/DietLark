import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/database_operations.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/screens/just_downloaded/name_gender/get_name_gender.dart';
import 'package:food_app/screens/user_account/account_operations.dart';
import 'package:food_app/screens/user_account/login/login_screen.dart';

class myAccount extends StatelessWidget {
  const myAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'الحساب الشخصي',
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
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight,
      width: screenWidth,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            HoldValues.USER_ACCOUNT,
            style:
                TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.7)),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            color: Colors.black.withOpacity(0.1),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'الإسم الاول',
                      style: TextStyle(fontFamily: kPrimaryFont, fontSize: 16),
                    ),
                    Spacer(),
                    Text(
                      HoldValues.USER_FIRST_NAME,
                      style: TextStyle(fontFamily: kPrimaryFont, fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    Text(
                      'اسم العائلة',
                      style: TextStyle(fontFamily: kPrimaryFont, fontSize: 16),
                    ),
                    Spacer(),
                    Text(
                      HoldValues.USER_SECOND_NAME,
                      style: TextStyle(fontFamily: kPrimaryFont, fontSize: 16),
                    )
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    Text(
                      'النوع',
                      style: TextStyle(fontFamily: kPrimaryFont, fontSize: 16),
                    ),
                    Spacer(),
                    Text(
                      HoldValues.USER_GENDER == 1 ? 'ذكر' : 'انثى',
                      style: TextStyle(fontFamily: kPrimaryFont, fontSize: 16),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () async {
                await UserAccountOperations().logoutAccount();
                await DatabaseOperations().logoutCleanData();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (Route<dynamic> route) => false);
              },
              child: Text(
                'تسجيل خروج',
                style: TextStyle(fontFamily: kPrimaryFont, color: Colors.red),
              )),
          Spacer(),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 15),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: ElevatedButton(
                onPressed: () {
                  HoldValues.isSignUpOperation = false;
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GetNameGendar()))
                      .then((value) => setState(() {
                            print('try refresh');
                          }));
                },
                child: Text(
                  'تعديل البيانات',
                  style: TextStyle(
                      fontFamily: kPrimaryFont,
                      fontSize: 16,
                      color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((state) {
                      if (state.contains(MaterialState.pressed)) {
                        return Colors.black.withOpacity(0.7);
                      }
                      return Colors.black.withOpacity(0.9);
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
              )),
        ],
      ),
    );
  }
}

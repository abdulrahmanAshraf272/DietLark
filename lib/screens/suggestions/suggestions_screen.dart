import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/constants.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SuggestionsPage extends StatelessWidget {
  const SuggestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'الشكاوى و الإقتراحات',
          style: TextStyle(
              fontFamily: kPrimaryFont, color: Colors.black87, fontSize: 18),
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
  final TextEditingController _controllerSuggestion = TextEditingController();

  Future sendSuggestion() async {
    final db = await FirebaseFirestore.instance;
    final user = await FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userInfo = {KEY_SUGGESTION: _controllerSuggestion.text};
      db
          .collection('users')
          .doc(user.uid)
          .set(userInfo, SetOptions(merge: true))
          .onError((e, _) => print("Error writing document: $e"));
      print('======= adding user info in Firebase is DONE! =======');
    } else {
      print('no account id');
    }
    EasyLoading.showSuccess('تم الإرسال');
    startTimer();
  }

  startTimer() {
    var duration = Duration(milliseconds: 1500);
    return Timer(duration, () {
      EasyLoading.dismiss();
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        height: screenHeight,
        width: screenWidth,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'ارسل الينا شكوتك او اقتراحك و سيتم الرد عليك في اقرب وقت على بريدك الإلكتروني',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: kPrimaryFont,
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.85)),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                maxLines: 4,
                controller: _controllerSuggestion,
                style: TextStyle(color: Colors.black, fontFamily: kPrimaryFont),
                decoration: InputDecoration(
                  hintText: 'اكتب شكوتك او اقتراحك هنا',
                  hintStyle: TextStyle(
                      fontFamily: kPrimaryFont,
                      color: Colors.black.withOpacity(0.6)),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.2),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 100,
                height: 45,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: ElevatedButton(
                  onPressed: () {
                    sendSuggestion();
                  },
                  child: Text(
                    'ارسال',
                    style: TextStyle(
                        fontFamily: kPrimaryFont,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.resolveWith((state) {
                        if (state.contains(MaterialState.pressed)) {
                          return Colors.black.withOpacity(0.7);
                        }
                        return Colors.black.withOpacity(0.9);
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TrySome extends StatefulWidget {
  const TrySome({super.key});

  @override
  State<TrySome> createState() => _TrySomeState();
}

class _TrySomeState extends State<TrySome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body2(),
    );
  }
}

class Body2 extends StatefulWidget {
  const Body2({super.key});

  @override
  State<Body2> createState() => _Body2State();
}

class _Body2State extends State<Body2> {
  int n = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('number: $n'),
        TextButton(
            onPressed: () {
              setState(() {
                n++;
              });
            },
            child: Text('increase'))
      ],
    );
  }
}

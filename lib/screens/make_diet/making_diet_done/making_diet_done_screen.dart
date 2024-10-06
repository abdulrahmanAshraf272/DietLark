import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/screens/myDiet/my_diet_screen.dart';
import 'package:lottie/lottie.dart';

class MakingDietDone extends StatelessWidget {
  const MakingDietDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: Lottie.asset('assets/icons/done_animation1.json',
                      repeat: false)),
              SizedBox(height: 0),
              Text(
                "تم تحضير برنامجك",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: kSecondaryFont,
                  fontSize: 26,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Text(
                    "احتياجك اليومي",
                    style: TextStyle(fontFamily: kSecondaryFont, fontSize: 20),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  amountOfMacros("السعرات الحرارية",
                      HoldValues.USER_CALORIES_INTAKE, "سعرة"),
                  amountOfMacros(
                      "الدهون الصحية", HoldValues.USER_FAT_INTAKE, "جرام"),
                  amountOfMacros(
                      "الكربوهيدرات", HoldValues.USER_CARB_INTAKE, "جرام"),
                  amountOfMacros(
                      "البروتين", HoldValues.USER_PROTEIN_INTAKE, "جرام"),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "أضف الاكلات الصحية الى وجباتك بشكل يومي ضمن حدود احتياجك اليومي من السعرات",
                style: TextStyle(
                    fontFamily: kPrimaryFont,
                    color: Colors.black.withOpacity(0.7)),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Container(
                width: screenWidth,
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xFF212121),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => MyDiet()));
                      },
                      child: Container(
                        width: screenWidth,
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "ابدأ",
                              style: TextStyle(
                                  fontFamily: kPrimaryFont,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget amountOfMacros(String text, int amount, String amountScale) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$text: $amount",
          style: TextStyle(
              fontFamily: kPrimaryFont,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        SizedBox(width: 5),
        Text(
          amountScale,
          style: TextStyle(fontFamily: kPrimaryFont, fontSize: 10),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/screens/make_diet/get_user_data/get_user_data_screen.dart';
import 'package:food_app/screens/myDiet/my_diet_screen.dart';
import 'package:food_app/screens/settings/setting_page/settings_screen.dart';
import 'package:food_app/size_config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'articles_section.dart';
import 'diet_types.dart';
import 'supplements_section.dart';

bool haveDiet = HoldValues.USER_HAVE_DIET;

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int gender = HoldValues.USER_GENDER;
  String text = "احصل الآن على نظام غذائي حسب هدفك ومستواك";
  bool isLoading = true;

  void getData() {
    haveDiet = HoldValues.USER_HAVE_DIET;
    if (haveDiet == false && gender == 1) {
      text = "احصل الآن على نظام غذائي حسب هدفك ومستواك";
    } else if (haveDiet == false && gender == 2) {
      text = "احصلي الآن على نظام غذائي حسب هدفك ومستواك";
    } else if (haveDiet == true && gender == 1) {
      text = "لا تنسى اضافة الاكلات الصحية الى وجباتك بشكل يومي";
    } else {
      text = "لا تنسي اضافة الاكلات الصحية الى وجباتك بشكل يومي";
    }

    print("refreashed");
  }

  @override
  Widget build(BuildContext context) {
    double _cardWidth = (SizeConfig.screenWidth - 90) / 2;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double cardHeight = screenHeight * 0.24;
    String textHaveNoDiet = "احصل الآن على نظام غذائي حسب هدفك ومستواك";
    String textHaveNoDietFemale = "احصلي الآن على نظام غذائي حسب هدفك ومستواك";
    String textHaveDiet = "لا تنسى اضافة الاكلات الصحية الى وجباتك بشكل يومي";
    String textHaveDietFemale =
        "لا تنسي اضافة الاكلات الصحية الى وجباتك بشكل يومي";
    String manImage = "assets/images/diet_card_man.png";
    String womanImage = "assets/images/diet_card_woman.png";

    String userName = HoldValues.USER_FIRST_NAME;

    getData();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Container(
              child: Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black.withOpacity(0.8),
                        size: 22,
                      )),
                  Spacer(),
                  IconButton(
                      onPressed: () async {
                        bool isConnected =
                            await HoldValues().checkInternetConnection();
                        if (isConnected) {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SettingsPage()))
                              .then((value) => setState(() {}));
                          ;
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              'لا يوجد اتصال بالإنترنت',
                              style: TextStyle(
                                  fontFamily: kPrimaryFont,
                                  color: Colors.white),
                            ),
                          ));
                        }
                      },
                      icon: Icon(
                        Icons.settings_outlined,
                        color: Colors.black.withOpacity(0.7),
                        size: 22,
                      ))
                ],
              ),
            ),
          ),
          Container(
            height: screenHeight * 0.27,
            width: screenWidth,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                      height: screenHeight * 0.24,
                      width: screenWidth,
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                          color: Color(0xFF334632),
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              colors: [Color(0xFF5a624d), Color(0xFF334632)],
                              begin: Alignment.topRight,
                              end: Alignment.center)),
                      child: Container(
                        margin: EdgeInsets.only(
                            right: screenWidth * 0.5, bottom: 14, left: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Text(
                                  "اهلا, ",
                                  style: TextStyle(
                                      fontFamily: kPrimaryFont,
                                      fontSize: 14,
                                      color: Colors.white.withOpacity(0.9)),
                                ),
                                Expanded(
                                  child: AutoSizeText(
                                    userName,
                                    style: TextStyle(
                                      fontFamily: kPrimaryFont,
                                      fontSize: 16,
                                      color: seventhColorPackage1,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: AutoSizeText(
                                text,
                                style: TextStyle(
                                    fontFamily: kPrimaryFont,
                                    fontSize: cardHeight * 0.108,
                                    color: Colors.white),
                                maxLines: 3,
                              ),
                            ),
                            ButtonNav2(
                              press: () async {
                                bool isConnected = await HoldValues()
                                    .checkInternetConnection();
                                if (isConnected) {
                                  if (haveDiet == true) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyDiet()),
                                    ).then((value) => setState(() {}));
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GetUserData()),
                                    ).then((value) => setState(() {}));
                                  }
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(
                                      'لا يوجد اتصال بالإنترنت',
                                      style: TextStyle(
                                          fontFamily: kPrimaryFont,
                                          color: Colors.white),
                                    ),
                                  ));
                                }
                              },
                            )
                          ],
                        ),
                      )),
                ),
                Container(
                  width: screenWidth * 0.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage(gender == 1 ? manImage : womanImage),
                          fit: BoxFit.fitHeight)),
                ),
              ],
            ),
          ),
          spaceBetween(),
          SectionTitle(title: "الأنظمة الغذائية"),
          DietTypes(),
          SizedBox(
            height: 10,
          ),
          SectionTitle(title: "دليل المكملات الغذائية"),
          SupplementsSection(),
          SectionTitle(title: "ثقف نفسك"),
          ArticlesSection(),
        ],
      ),
    );
  }

  SizedBox spaceBetween() => SizedBox(
        height: 20,
      );
}

class ButtonNav extends StatelessWidget {
  const ButtonNav({
    super.key,
    required this.text,
    required this.press,
  });
  final String text;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double cardHeight = screenHeight * 0.24;
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        height: 38,
        width: screenWidth * 0.25,
        decoration: BoxDecoration(
            color: seventhColorPackage1,
            borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Container(
                height: 40,
                width: screenWidth * 0.25,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        text,
                        style: TextStyle(
                            fontFamily: kPrimaryFont,
                            color: Colors.white,
                            fontSize: 14),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 16,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonNav2 extends StatelessWidget {
  const ButtonNav2({super.key, required this.press});

  final Function() press;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        height: 38,
        width: screenWidth * 0.25,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: ElevatedButton(
          onPressed: press,
          child: Text(
            'ابدأ',
            style: TextStyle(
                fontFamily: kPrimaryFont, fontSize: 16, color: Colors.white),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((state) {
                if (state.contains(MaterialState.pressed)) {
                  return seventhColorPackage1.withOpacity(0.8);
                }
                return seventhColorPackage1;
              }),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              )),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: "CairoRegular",
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/models/DietTypesAssets.dart';
import 'package:food_app/screens/dietType_details/dietType_details_screen.dart';
import 'package:food_app/screens/make_diet/making_diet/making_diet.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

final pageController = PageController();

int theGender = 0;
int theAcivity = 0;
int theGoal = 0;
int theDietType = 0;
int theAge = 0;

double progressPercent = 0;

double? currentPageNo = pageController.page;

final TextEditingController ageController = TextEditingController();
final TextEditingController heightContoller = TextEditingController();
final TextEditingController weightController = TextEditingController();

class GetUserData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screanWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: AllPages(),
    );
  }
}

class AllPages extends StatefulWidget {
  const AllPages({
    super.key,
  });

  @override
  State<AllPages> createState() => _AllPagesState();
}

class _AllPagesState extends State<AllPages> {
  //final pageController = PageController();
  double progress = 0;
  FocusNode focusNode = FocusNode();
  FocusNode heightFocusNode = FocusNode();
  FocusNode weightFocusNode = FocusNode();
  String ageHintText = "25";
  String heightHintText = '170';
  String weightHintText = '70';

  @override
  void initState() {
    // TODO: implement initState
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        ageHintText = '';
      } else {
        ageHintText = '25';
      }
      setState(() {});
    });

    heightFocusNode.addListener(() {
      if (heightFocusNode.hasFocus) {
        heightHintText = '';
      } else {
        heightHintText = '170';
      }
      setState(() {});
    });

    weightFocusNode.addListener(() {
      if (weightFocusNode.hasFocus) {
        weightHintText = '';
      } else {
        weightHintText = '70';
      }
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screanHeight = MediaQuery.of(context).size.height;
    double screanWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        //padding: EdgeInsets.all(20),
        height: screanHeight,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20, right: 10, left: 10),
              height: 60,
              width: screanWidth,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        //Go to the previus page.
                        if (pageController.page == 0) {
                          Navigator.pop(context);
                        } else {
                          pageController.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        }
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      )),
                  Spacer(),
                  LinearPercentIndicator(
                      barRadius: Radius.circular(5),
                      animateFromLastPercent: true,
                      isRTL: true,
                      animation: true,
                      lineHeight: 10,
                      width: screanWidth * 0.55,
                      percent: progress,
                      progressColor: Colors.black,
                      backgroundColor: Colors.black.withOpacity(0.1)),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ///////////////////////////////////////////////////////
                  ////////////== First Page (Gender and age) ==///////////
                  ///////////////////////////////////////////////////////
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "العمر؟",
                          style: QtextStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: ageController,
                          textAlign: TextAlign.center,
                          focusNode: focusNode,
                          decoration: InputDecoration(
                              hintText: ageHintText,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none)),
                        ),
                        Spacer(),
                        Container(
                          width: screanWidth,
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
                                  //Get the value of the user age.
                                  if (ageController.text.isNotEmpty) {
                                    int age = int.parse(ageController.text);
                                    if (age > minAge && age < maxAge) {
                                      //Save the value.
                                      HoldValues.USER_AGE = age;
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text("اعد كتابة العمر"),
                                      ));
                                      return;
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text("أدخل العمر"),
                                    ));
                                    return;
                                  }

                                  //Go to the next page.
                                  pageController.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                  //increase the progress bar.
                                  if (progress < 0.2) {
                                    setState(() {
                                      progress = 0.2;
                                    });
                                  }
                                },
                                child: BtnBlack(),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  ///////////////////////////////////////////////////////
                  ////////////== Second Page (height and weight) ==///////////
                  ///////////////////////////////////////////////////////
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          "الطول؟  -cm-",
                          style: QtextStyle,
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: heightContoller,
                          textAlign: TextAlign.center,
                          focusNode: heightFocusNode,
                          decoration: InputDecoration(
                              hintText: heightHintText,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "الوزن؟  -kg-",
                          style: QtextStyle,
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: weightController,
                          textAlign: TextAlign.center,
                          focusNode: weightFocusNode,
                          decoration: InputDecoration(
                              hintText: weightHintText,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none)),
                        ),
                        Spacer(),
                        Container(
                          width: screanWidth,
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
                                    if (heightContoller.text.isNotEmpty) {
                                      //take it as double first , if the user enter double value.
                                      double heightDouble =
                                          double.parse(heightContoller.text);
                                      int height = heightDouble.round();
                                      if (height > minHeight &&
                                          height < maxHeight) {
                                        HoldValues.USER_HEIGHT =
                                            int.parse(heightContoller.text);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text("اعد كتابة الطول"),
                                        ));
                                        return;
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text("أدخل الطول"),
                                      ));
                                      return;
                                    }

                                    if (weightController.text.isNotEmpty) {
                                      double weight =
                                          double.parse(weightController.text);
                                      if (weight > minWeight &&
                                          weight < maxWeight) {
                                        HoldValues.USER_WEIGHT = weight;
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text("اعد كتابة الوزن"),
                                        ));
                                        return;
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text("أدخل الوزن"),
                                      ));
                                      return;
                                    }

                                    //Go to the next page.
                                    pageController.nextPage(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.easeInOut);
                                    //increase the progress bar.
                                    if (progress < 0.4) {
                                      setState(() {
                                        progress = 0.4;
                                      });
                                    }
                                  },
                                  child: BtnBlack()),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  ///////////////////////////////////////////////////////
                  ////////////== Third Page (activity) ==///////////
                  ///////////////////////////////////////////////////////
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          "كم مرة تمارس الرياضة في الاسبوع؟",
                          textAlign: TextAlign.center,
                          style: QtextStyle,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ListItem(
                                  icon: "assets/icons/activity1.png",
                                  subtitle: "انا شخص لا امارس الرياضة",
                                  press: () {
                                    setState(() {
                                      theAcivity = 1;
                                    });
                                  },
                                  borderColor: theAcivity == 1
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                ListItem(
                                  icon: "assets/icons/activity2.png",
                                  subtitle:
                                      "امارس الرياضي من مرتين الى 3 مرات في الاسبوع",
                                  press: () {
                                    setState(() {
                                      theAcivity = 2;
                                    });
                                  },
                                  borderColor: theAcivity == 2
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                ListItem(
                                  icon: "assets/icons/activity3.png",
                                  subtitle:
                                      "امارس الرياضة من 4 الى 5 مرات في الاسبوع",
                                  press: () {
                                    setState(() {
                                      theAcivity = 3;
                                    });
                                  },
                                  borderColor: theAcivity == 3
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                ListItem(
                                  icon: "assets/icons/activity4.png",
                                  subtitle:
                                      "امارس الرياضة من 6 الى 7 مرات في الاسبوع",
                                  press: () {
                                    setState(() {
                                      theAcivity = 4;
                                    });
                                  },
                                  borderColor: theAcivity == 4
                                      ? Colors.black
                                      : Colors.white,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                ListItem(
                                  icon: "assets/icons/activity5.png",
                                  subtitle:
                                      "امارس الرياضة مرتين يوميا من 6 الى 7 مرات في الاسبوع",
                                  press: () {
                                    setState(() {
                                      theAcivity = 5;
                                    });
                                  },
                                  borderColor: theAcivity == 5
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: screanWidth,
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
                                    if (theAcivity != 0) {
                                      switch (theAcivity) {
                                        case 1:
                                          HoldValues.USER_ACTIVITY = 1.2;
                                          break;
                                        case 2:
                                          HoldValues.USER_ACTIVITY = 1.37;
                                          break;
                                        case 3:
                                          HoldValues.USER_ACTIVITY = 1.55;
                                          break;
                                        case 4:
                                          HoldValues.USER_ACTIVITY = 1.72;
                                          break;
                                        case 5:
                                          HoldValues.USER_ACTIVITY = 1.9;
                                          break;
                                      }

                                      //Move to the next page.
                                      pageController.nextPage(
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.easeInOut);
                                      //increase the progress bar.
                                      if (progress < 0.6) {
                                        setState(() {
                                          progress = 0.6;
                                        });
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text("أختر نشاطك الاسبوعي!"),
                                      ));
                                    }
                                  },
                                  child: BtnBlack()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ///////////////////////////////////////////////////////
                  ////////////== Forth Page (Goal) ==///////////
                  ///////////////////////////////////////////////////////
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          "ما الهدف الذي تريد تحقيقه؟",
                          textAlign: TextAlign.center,
                          style: QtextStyle,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ListItemGoal(
                                    title: "خسارة الوزن والدهون",
                                    subtitle:
                                        "انا وزني زائد واريد ان اركز على حرق الدهون والتنشيف",
                                    borderColor: theGoal == 1
                                        ? Colors.black
                                        : Colors.white,
                                    press: () {
                                      setState(() {
                                        theGoal = LOSS_WEIGHT;
                                      });
                                    },
                                    icon: "assets/icons/loss_weight.png"),
                                ListItemGoal(
                                    title: "اكتساب كتلة عضلية",
                                    subtitle:
                                        "هدفي الوصول لجسم رياضي وزيادة الكتلة العضلية",
                                    borderColor: theGoal == 2
                                        ? Colors.black
                                        : Colors.white,
                                    press: () {
                                      setState(() {
                                        theGoal = GAIN_WEIGHT;
                                      });
                                    },
                                    icon: "assets/icons/gain_weight.png"),
                                ListItemGoal(
                                    title: "تثبيت وزني الحالي",
                                    subtitle:
                                        "هدفي هو الحفاظ على شكل جسمي ووزني الحالي",
                                    borderColor: theGoal == 3
                                        ? Colors.black
                                        : Colors.white,
                                    press: () {
                                      setState(() {
                                        theGoal = MAINTAIN_WEIGHT;
                                      });
                                    },
                                    icon: "assets/icons/keep_weight.png"),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: screanWidth,
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
                                    if (theGoal != 0) {
                                      //hold the value
                                      HoldValues.USER_GOAL = theGoal;

                                      //move to the next page.
                                      pageController.nextPage(
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.easeInOut);
                                      //increase the progress bar.
                                      if (progress < 0.8)
                                        setState(() {
                                          progress = 0.8;
                                        });
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text("اختر هدفك!"),
                                      ));
                                    }
                                  },
                                  child: BtnBlack()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "ما نوع الدايت الذي تفضله؟ ",
                            textAlign: TextAlign.center,
                            style: QtextStyle,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ListItemDietType(
                                    title: "الدايت المتوازن",
                                    subtitle: balanced_diet_subtitle,
                                    borderColor: theDietType == BALANCED_DIET
                                        ? Colors.black
                                        : Colors.white,
                                    press: () {
                                      setState(() {
                                        theDietType = BALANCED_DIET;
                                      });
                                    },
                                    icon: "assets/icons/balanced_diet.png",
                                    explainPress: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DietTypeDetails(
                                                      dietTypesAssets:
                                                          dietTypesList[1])));
                                    },
                                  ),
                                  ListItemDietType(
                                    title: "دايت الكيتو",
                                    subtitle: keto_diet_subtitle,
                                    borderColor: theDietType == KETO_DIET
                                        ? Colors.black
                                        : Colors.white,
                                    press: () {
                                      setState(() {
                                        theDietType = KETO_DIET;
                                      });
                                    },
                                    icon: "assets/icons/keto_diet.png",
                                    explainPress: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DietTypeDetails(
                                                      dietTypesAssets:
                                                          dietTypesList[0])));
                                    },
                                  ),
                                  ListItemDietType(
                                    title: "دايت منخفض الكربوهيدرات",
                                    subtitle: lowCarb_diet_subtitle,
                                    borderColor: theDietType == LOW_CARB_DIET
                                        ? Colors.black
                                        : Colors.white,
                                    press: () {
                                      setState(() {
                                        theDietType = LOW_CARB_DIET;
                                      });
                                    },
                                    icon: "assets/icons/low_carb_diet.png",
                                    explainPress: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DietTypeDetails(
                                                      dietTypesAssets:
                                                          dietTypesList[2])));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: screanWidth,
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
                                      if (theDietType != 0) {
                                        //Save the value.
                                        HoldValues.USER_DIET_TYPE = theDietType;
                                        //Print all values.
                                        print(HoldValues.USER_GENDER);
                                        print(HoldValues.USER_AGE);
                                        print(HoldValues.USER_HEIGHT);
                                        print(HoldValues.USER_WEIGHT);
                                        print(HoldValues.USER_ACTIVITY);
                                        print(HoldValues.USER_GOAL);
                                        print(HoldValues.USER_DIET_TYPE);
                                        //Go to Making diet page.
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MakingDietPlan()));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              "اختر نوع الدايت الذي تفضله!"),
                                        ));
                                      }
                                    },
                                    child: BtnBlack()),
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BtnBlack extends StatelessWidget {
  const BtnBlack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screanWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screanWidth,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "التالي",
            style: TextStyle(
                fontFamily: kPrimaryFont, color: Colors.white, fontSize: 16),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 16,
          )
        ],
      ),
    );
  }
}

class ListItemGoal extends StatelessWidget {
  const ListItemGoal(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.borderColor,
      required this.press,
      required this.icon});

  final String title;
  final String subtitle;
  final String icon;
  final Color borderColor;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 80,
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(0xFFfefefe),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8)
            ],
            border: Border.all(color: borderColor)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5, right: 5),
              child: Image.asset(icon),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    title,
                    style: TextStyle(fontFamily: kSecondaryFont, fontSize: 14),
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    subtitle,
                    style: TextStyle(
                        fontFamily: kPrimaryFont,
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.7)),
                    maxLines: 1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListItemDietType extends StatelessWidget {
  const ListItemDietType(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.borderColor,
      required this.press,
      required this.icon,
      required this.explainPress});

  final String title;
  final String subtitle;
  final String icon;
  final Color borderColor;
  final Function() press;
  final Function() explainPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 15),
      //padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(0xFFfefefe),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8)
          ],
          border: Border.all(color: borderColor)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: press,
              child: Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                    child: Image.asset(icon),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          title,
                          style: TextStyle(
                              fontFamily: kSecondaryFont, fontSize: 14),
                          maxLines: 1,
                        ),
                        AutoSizeText(
                          subtitle,
                          style: TextStyle(
                              fontFamily: kPrimaryFont,
                              fontSize: 12,
                              color: Colors.black.withOpacity(0.7)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: explainPress,
            child: Container(
                width: 45,
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.question_mark_outlined,
                      size: 16,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "المزيد",
                      style: TextStyle(
                          fontFamily: kPrimaryFont,
                          fontSize: 9,
                          color: Colors.black.withOpacity(0.7)),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.icon,
    required this.subtitle,
    required this.press,
    required this.borderColor,
  });

  final String icon;
  final String subtitle;
  final Color borderColor;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    double screanHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.top;
    double screanWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: press,
      child: Container(
        height: 80,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(0xFFfefefe),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8)
            ],
            border: Border.all(color: borderColor)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5, right: 5),
              child: Image.asset(icon),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: AutoSizeText(
                subtitle,
                style: TextStyle(
                    fontFamily: kPrimaryFont,
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.9)),
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GenderPage extends StatefulWidget {
  const GenderPage({super.key});

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  int genderSelected = 0;

  @override
  Widget build(BuildContext context) {
    double screanHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.top;
    double screanWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "النوع؟",
            style: QtextStyle,
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
                    genderSelected = 1;
                  });
                },
                child: Container(
                  height: screanWidth * 0.30,
                  width: screanWidth * 0.30,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xFFfefefe),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1), blurRadius: 8)
                      ],
                      border: Border.all(
                          color: genderSelected == 1
                              ? Colors.black
                              : Colors.white)),
                  child: GenderIcon(
                    gender: 1,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    genderSelected = 2;
                  });
                },
                child: Container(
                  height: screanWidth * 0.30,
                  width: screanWidth * 0.30,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xFFfefefe),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1), blurRadius: 8)
                      ],
                      border: Border.all(
                          color: genderSelected == 2
                              ? Colors.black
                              : Colors.white)),
                  child: GenderIcon(gender: 2),
                ),
              ),
            ],
          ),
        ],
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

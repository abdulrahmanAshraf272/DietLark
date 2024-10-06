import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';

class TimeAndMealsBar extends StatelessWidget {
  final int cookingTime, mealsNo, calories;
  const TimeAndMealsBar({
    Key? key,
    required this.cookingTime,
    required this.mealsNo,
    required this.calories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(children: [
                Image.asset(
                  "assets/images/caloriesIcon.png",
                  width: 30,
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "$calories سعرة",
                  style: TextStyle(fontFamily: kPrimaryFont, fontSize: 16),
                )
              ]),
            ],
          ),
          IconsAndTitle(
            theIcon: Icons.timer_sharp,
            theTitle: "${cookingTime} دقيقة",
            theTitle2: "وقت الطبخ",
          ),
          IconsAndTitle(
            theIcon: Icons.person,
            theTitle: "${mealsNo} وجبات",
            theTitle2: "عدد الوجبات",
          ),
        ],
      ),
    );
  }
}

class IconsAndTitle extends StatelessWidget {
  final IconData theIcon;
  final String theTitle;
  final String theTitle2;
  const IconsAndTitle(
      {super.key,
      required this.theIcon,
      required this.theTitle,
      required this.theTitle2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Icon(
            theIcon,
            color: Color(0xFFfd7D40),
          ),
          SizedBox(
            width: 3,
          ),
          Text(
            theTitle,
            style: TextStyle(fontFamily: kPrimaryFont, fontSize: 16),
          )
        ]),
      ],
    );
  }
}

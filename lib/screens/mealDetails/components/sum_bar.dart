import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DisplayTheSum extends StatelessWidget {
  const DisplayTheSum({
    Key? key,
    required this.caloriesSum,
    required this.proteinSum,
    required this.carbSum,
    required this.fatSum,
  }) : super(key: key);

  final int caloriesSum;
  final double proteinSum, carbSum, fatSum;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 78,
      width: screenWidth,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Color(0xFFf8f8f8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(child: sumItem("سعرات", "$caloriesSum", kRedColor)),
          Expanded(child: sumItem("بروتين", "$proteinSum", Color(0xFF333333))),
          Expanded(child: sumItem("دهون", "$fatSum", Color(0xFF333333))),
          Expanded(
              child: sumItem("كاربوهيدرات", "$carbSum", Color(0xFF333333))),
        ],
      ),
    );
  }

  Column sumItem(String title, String number, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AutoSizeText(
          number,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: color),
          textAlign: TextAlign.center,
          maxLines: 1,
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 12, fontFamily: kPrimaryFont, color: Colors.black38),
        ),
      ],
    );
  }
}

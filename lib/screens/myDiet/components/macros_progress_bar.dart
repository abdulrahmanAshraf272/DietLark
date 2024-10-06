import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MacrosProgressLine extends StatelessWidget {
  const MacrosProgressLine({
    Key? key,
    required this.proteinPercent,
    required this.proteinSumAll,
    required this.proteinTarget,
    required this.carbPercent,
    required this.carbSumAll,
    required this.carbTarget,
    required this.fatPercent,
    required this.fatSumAll,
    required this.fatTarget,
  }) : super(key: key);

  final double proteinPercent;
  final num proteinSumAll;
  final int proteinTarget;
  final double carbPercent;
  final num carbSumAll;
  final int carbTarget;
  final double fatPercent;
  final num fatSumAll;
  final int fatTarget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ProgressLineItem(
            macroTitle: "بروتين",
            macroPercent: proteinPercent,
            macroSumAll: proteinSumAll,
            macroTarget: proteinTarget),
        ProgressLineItem(
            macroTitle: "كربوهيدرات",
            macroPercent: carbPercent,
            macroSumAll: carbSumAll,
            macroTarget: carbTarget),
        ProgressLineItem(
            macroTitle: "دهون",
            macroPercent: fatPercent,
            macroSumAll: fatSumAll,
            macroTarget: fatTarget),
      ],
    );
  }
}

class ProgressLineItem extends StatelessWidget {
  const ProgressLineItem({
    Key? key,
    required this.macroPercent,
    required this.macroSumAll,
    required this.macroTarget,
    required this.macroTitle,
  }) : super(key: key);

  final double macroPercent;
  final num macroSumAll;
  final int macroTarget;
  final String macroTitle;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Text(
          macroTitle,
          style: TextStyle(fontFamily: kPrimaryFont, color: Color(0xFFfcfffa)),
        ),
        SizedBox(
          height: 2,
        ),
        LinearPercentIndicator(
            barRadius: Radius.circular(5),
            lineHeight: 6,
            width: screenWidth * 0.2,
            percent: macroPercent < 1 ? macroPercent : 1,
            progressColor: Color(0xFF222e21),
            backgroundColor: Colors.white.withOpacity(0.1)),
        SizedBox(
          height: 3,
        ),
        Text("${macroSumAll.toInt()}/$macroTarget",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
      ],
    );
  }
}

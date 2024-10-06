import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/size_config.dart';

//////////////// -- The top Header and name of nutrient -- //////////////////
class HeaderAndTitle extends StatelessWidget {
  final Color nutrientColor;
  final String nutrientName;
  const HeaderAndTitle({
    Key? key,
    required this.nutrientColor,
    required this.nutrientName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 20),
      height: screenHeight * 0.22,
      width: screenWidth,
      decoration: BoxDecoration(
          color: nutrientColor,
          boxShadow: [kDefaultShadow],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          image: DecorationImage(
              image: AssetImage("assets/images/foodBackground.png"),
              fit: BoxFit.cover)),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: screenWidth - 80,
          child: Center(
            child: AutoSizeText(
              nutrientName,
              maxLines: 1,
              style: TextStyle(
                  fontFamily: kFontDGSahabah,
                  fontSize: 40,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

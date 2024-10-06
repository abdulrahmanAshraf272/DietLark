import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/size_config.dart';

class ImageAndInfoBar extends StatelessWidget {
  final String image;
  final int calories;
  final double protein, carb, fat;
  const ImageAndInfoBar({
    Key? key,
    required this.image,
    required this.calories,
    required this.protein,
    required this.carb,
    required this.fat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight * 0.4,
      child: Stack(
        children: [
          Container(
            height: SizeConfig.screenHeight * 0.4 - 50,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(50)),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                width: SizeConfig.screenWidth * 0.9,
                height: 100,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 5),
                          blurRadius: 50,
                          color: Color(0xFF12153D).withOpacity(0.2))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: "$calories\n",
                              style: TextStyle(
                                  fontFamily: kPrimaryFont,
                                  fontSize: 26,
                                  color: kRedColor)),
                          TextSpan(
                              text: "سعرات",
                              style: TextStyle(
                                  fontFamily: kPrimaryFont,
                                  fontSize: 14,
                                  color: Colors.black87))
                        ])),
                    Container(
                      width: 1,
                      height: 60,
                      color: Colors.black45,
                    ),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: "$protein\n",
                              style: TextStyle(
                                  fontFamily: kPrimaryFont,
                                  fontSize: 22,
                                  color: kTextColor2)),
                          TextSpan(
                              text: "بروتين",
                              style: TextStyle(
                                  fontFamily: kPrimaryFont,
                                  fontSize: 12,
                                  color: Colors.black87))
                        ])),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: "$fat\n",
                              style: TextStyle(
                                  fontFamily: kPrimaryFont,
                                  fontSize: 22,
                                  color: kTextColor2)),
                          TextSpan(
                              text: "دهون",
                              style: TextStyle(
                                  fontFamily: kPrimaryFont,
                                  fontSize: 12,
                                  color: Colors.black87))
                        ])),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: "$carb\n",
                              style: TextStyle(
                                  fontFamily: kPrimaryFont,
                                  fontSize: 22,
                                  color: kTextColor2)),
                          TextSpan(
                              text: "كاربهيدرات",
                              style: TextStyle(
                                  fontFamily: kPrimaryFont,
                                  fontSize: 12,
                                  color: Colors.black87))
                        ])),
                  ],
                )),
          ),
          Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios)))
        ],
      ),
    );
  }
}

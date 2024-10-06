import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/size_config.dart';

class HeaderAndRecipeName extends StatelessWidget {
  final String name, image;
  const HeaderAndRecipeName({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statebarHeight = MediaQuery.of(context).viewPadding.top;
    return Container(
      height: SizeConfig.screenHeight * 0.3,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: SizeConfig.screenHeight * 0.13,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.transparent
                  ])),
            ),
          ),
          Positioned(
              bottom: 15,
              right: 15,
              child: Container(
                width: SizeConfig.screenWidth - 10,
                child: AutoSizeText(
                  name,
                  style: TextStyle(
                      fontFamily: kPrimaryFont,
                      fontSize: 26,
                      color: Colors.white),
                  maxLines: 2,
                ),
              )),
          Positioned(
              right: 0,
              top: statebarHeight,
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios)))
        ],
      ),
    );
  }
}

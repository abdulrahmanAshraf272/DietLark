import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/models/SupplementsAssets.dart';
import 'package:food_app/models/ads_test/bannar_ad_model.dart';
import 'package:food_app/models/ads_test/interstitial_ad_model.dart';
import 'package:food_app/models/description.dart';
import 'package:food_app/size_config.dart';
import 'dart:math' as math;

class Body extends StatefulWidget {
  final SupplementsAssets supplementsAssets;
  const Body({Key? key, required this.supplementsAssets}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  late AnimationController _fadeAnimationController;
  @override
  void initState() {
    _fadeAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: animationDuration));

    Timer(Duration(milliseconds: 50), () => _fadeAnimationController.forward());

    // TODO: implement initState
    super.initState();
    //Display Ad if the user came from notification
    displayAdNotiIsClicked();
  }

  @override
  void dispose() {
    _fadeAnimationController.dispose();
    displayInterstialAdDipose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                TopContainer(
                    image: widget.supplementsAssets.image,
                    name: widget.supplementsAssets.name,
                    color: widget.supplementsAssets.color),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FadeTransition(
                        opacity: _fadeAnimationController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            titleText(widget.supplementsAssets.name),
                            Text(
                              widget.supplementsAssets.desc,
                              style: kDesFontStyle,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            titleText("فوائده"),
                            Text(
                              widget.supplementsAssets.benefits,
                              style: kDesFontStyle,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            titleText("طريقة الاستخدام"),
                            Text(
                              widget.supplementsAssets.dosage,
                              style: kDesFontStyle,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            widget.supplementsAssets.types != ""
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      titleText("أنواعه"),
                                      Text(
                                        widget.supplementsAssets.types,
                                        style: kDesFontStyle,
                                      ),
                                      SizedBox(
                                        height: 80,
                                      )
                                    ],
                                  )
                                : SizedBox(
                                    height: 0,
                                  )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(bottom: 0, right: 0, left: 0, child: AdBannarContainer())
        ],
      ),
    );
  }

  Text titleText(String title) {
    return Text(
      title,
      style: TextStyle(fontFamily: kFontDGSahabah, fontSize: 22),
    );
  }
}

class TopContainer extends StatelessWidget {
  final String image, name;
  final Color color;
  const TopContainer(
      {Key? key, required this.image, required this.name, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.4,
      decoration: BoxDecoration(color: color
          //image: DecorationImage(
          //  image: AssetImage("assets/images/background14.png"),
          //fit: BoxFit.cover)
          ),
      child: Stack(
        children: [
          Positioned(
              right: 0,
              child: Container(
                height: screenHeight * 0.4,
                width: screenWidth * 0.7,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.transparent,
                    ])),
              )),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              height: SizeConfig.screenHeight * 0.07,
            ),
          ),
          Positioned(
            right: 5,
            bottom: 0,
            child: Container(
              height: screenWidth * 0.66,
              width: screenWidth * 0.5,
              child: Hero(
                tag: 'location-img-${image}',
                child: Image.asset(
                  image,
                  //height: SizeConfig.screenHeight * 0.31,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.15,
            right: screenWidth * 0.53,
            child: Container(
              width: screenWidth * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText("مكمل",
                      style: TextStyle(
                          fontFamily: kFontDGSahabah,
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 22)),
                  AutoSizeText(
                    name,
                    style: TextStyle(
                        fontFamily: kFontDGSahabah,
                        color: Colors.white,
                        fontSize: 33),
                    maxLines: 1,
                  )
                ],
              ),
            ),
          ),
          Positioned(
              right: 0,
              top: 0,
              child: Column(
                children: [
                  SafeArea(child: Container()),
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios)),
                ],
              ))
        ],
      ),
    );
  }
}

class MyArc extends StatelessWidget {
  final double diameter;

  const MyArc({super.key, this.diameter = 200});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(),
      size: Size(diameter, diameter),
    );
  }
}

// This is the Painter class
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blue;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      math.pi,
      math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/* 
Container(
                height: SizeConfig.screenHeight * 0.4,
                width: SizeConfig.screenWidth * 0.7,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.transparent,
                    ])),
              )
*/


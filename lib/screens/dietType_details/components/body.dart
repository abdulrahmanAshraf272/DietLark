import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/DietTypesAssets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:food_app/models/ads_test/bannar_ad_model.dart';
import 'package:food_app/models/ads_test/interstitial_ad_model.dart';

class Body extends StatefulWidget {
  final DietTypesAssets dietTypesAssets;
  const Body({Key? key, required this.dietTypesAssets}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Display Ad if the user came from notification
    displayAdNotiIsClicked();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    displayInterstialAdDipose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned.fill(
          child: Column(
            children: [
              Stack(
                children: [
                  HeaderTitle(dietTypesAssets: widget.dietTypesAssets),
                  GoBackArrow()
                ],
              ),
              SizedBox(
                height: 12,
              ),
              widget.dietTypesAssets.proteinPer != 0
                  ? Container(
                      width: screenWidth,
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 16),
                      height: 78,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFFf8f8f8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              child: Items("بروتين",
                                  "${widget.dietTypesAssets.proteinPer}%")),
                          Expanded(
                              child: Items("كربوهيدرات",
                                  "${widget.dietTypesAssets.carbPer}%")),
                          Expanded(
                              child: Items(
                                  "دهون", "${widget.dietTypesAssets.fatPer}%")),
                        ],
                      ),
                    )
                  : SizedBox(
                      height: 16,
                    ),
              Expanded(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    widget.dietTypesAssets.des,
                    style: TextStyle(
                        fontFamily: kPrimaryFont,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                ),
              )),
            ],
          ),
        ),
        Positioned(bottom: 0, right: 0, left: 0, child: AdBannarContainer())
      ],
    );
  }

  Column Items(String title, String number) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AutoSizeText(
          number,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
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

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    super.key,
    required this.dietTypesAssets,
  });

  final DietTypesAssets dietTypesAssets;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      //padding: EdgeInsets.only(top: 20),
      height: screenHeight * 0.25,
      width: screenWidth,
      decoration: BoxDecoration(
          boxShadow: [kDefaultShadow],
          image: DecorationImage(
              image: AssetImage(dietTypesAssets.image), fit: BoxFit.cover)),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: screenWidth,
          padding: EdgeInsets.only(left: 20, right: 20, top: 15),
          color: Colors.black.withOpacity(0.5),
          child: Center(
            child: AutoSizeText(
              dietTypesAssets.title,
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

class GoBackArrow extends StatelessWidget {
  const GoBackArrow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statebarHeight = MediaQuery.of(context).viewPadding.top;
    return Positioned(
        right: 0,
        top: statebarHeight,
        child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios)));
  }
}

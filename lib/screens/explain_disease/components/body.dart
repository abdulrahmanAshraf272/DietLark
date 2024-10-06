import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/DiseasesAssets.dart';
import 'package:food_app/models/ads_test/interstitial_ad_model.dart';
import 'package:food_app/models/description.dart';
import 'package:food_app/screens/category_selected/category_selected_screen.dart';
import 'package:food_app/screens/explain_disease/components/header_and_title.dart';
import 'package:food_app/size_config.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'description_disease.dart';

class Body extends StatefulWidget {
  final DiseasesAssets diseasesAssets;
  const Body({Key? key, required this.diseasesAssets}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    displayAdNotiIsClicked();
  }

  @override
  Widget build(BuildContext context) {
    var statebarHeight = MediaQuery.of(context).viewPadding.top;
    return Column(
      children: [
        HeaderAndTitle(
          statebarHeight: statebarHeight,
          diseasesAssets: widget.diseasesAssets,
        ),
        DescriptionDisease(
          diseasesAssets: widget.diseasesAssets,
        ),
        Button(
          diseasesAssets: widget.diseasesAssets,
        )
      ],
    );
  }
}

class Button extends StatelessWidget {
  final DiseasesAssets diseasesAssets;
  const Button({
    Key? key,
    required this.diseasesAssets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 15, top: 10, right: 20, left: 20),
        child: Container(
          width: screenWidth,
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
                onTap: () async {
                  int res = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategorySelected(
                                    theList: diseasesAssets.diseasesFood,
                                    theTitle: diseasesAssets.title,
                                  ))) ??
                      0;
                  if (res == 1) {
                    Navigator.pop(context, 1);
                  }
                },
                child: Container(
                  width: screenWidth,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: AutoSizeText(
                          diseasesAssets.title,
                          style: TextStyle(
                              fontFamily: kPrimaryFont,
                              color: Colors.white,
                              fontSize: 16),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        ),
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
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/ArticleAssets.dart';
import 'package:food_app/models/DiseasesAssets.dart';
import 'package:food_app/screens/display_references/display_references_screen.dart';
import 'package:food_app/size_config.dart';

class HeaderAndTitle extends StatelessWidget {
  final ArticleAssets articleAssets;
  const HeaderAndTitle(
      {Key? key, required this.statebarHeight, required this.articleAssets})
      : super(key: key);

  final double statebarHeight;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * 0.3,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              articleAssets.image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: screenHeight * 0.13,
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
                width: screenWidth * 0.93,
                child: AutoSizeText(
                  articleAssets.title,
                  style: TextStyle(
                      fontFamily: kPrimaryFont,
                      fontSize: 24,
                      color: Colors.white),
                  maxLines: 2,
                ),
              )),
          Positioned(
              right: 0,
              top: statebarHeight,
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white.withOpacity(0.8),
                    size: 20,
                  ))),
          Positioned(
              left: 15,
              top: statebarHeight + 7,
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DisplayReferences(
                            references: articleAssets.resources))),
                child: Container(
                  alignment: Alignment.center,
                  width: 85,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "المراجع",
                        style: TextStyle(
                            fontFamily: kPrimaryFont,
                            color: Colors.white.withOpacity(0.8)),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Icon(Icons.arrow_forward_ios,
                          size: 16, color: Colors.white.withOpacity(0.8)),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

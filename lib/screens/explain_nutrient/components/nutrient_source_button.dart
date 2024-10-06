import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/category_selected/category_selected_screen.dart';
import 'package:food_app/size_config.dart';
import 'package:auto_size_text/auto_size_text.dart';

class NutrientSourcesButton extends StatelessWidget {
  final nutrientName;
  final theColor;
  final theList;
  const NutrientSourcesButton({
    Key? key,
    required this.nutrientName,
    this.theColor,
    this.theList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String theTitle = "أهم مصادر $nutrientName";
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
                                    theList: theList,
                                    theTitle: theTitle,
                                    theColor: theColor,
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
                          theTitle,
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
                      ),
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

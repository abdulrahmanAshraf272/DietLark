import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/models/DiseasesAssets.dart';
import 'package:food_app/models/NutrientsAssets.dart';
import 'package:food_app/screens/explain_disease/explain_disease_screen.dart';
import 'package:food_app/screens/explain_nutrient/explain_nutrient_screen.dart';
import 'package:food_app/size_config.dart';

double cardWidth = SizeConfig.screenWidth * 0.8;
double cardHeight = cardWidth * 0.57;

////////////////// - Featured plants -/////////////////////

class DiseasesSection extends StatelessWidget {
  const DiseasesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double cardWidth = screenWidth * 0.8;
    double cardHeight = cardWidth * 0.57;
    return SizedBox(
      height: cardHeight + 20,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: diseasesList.length,
        padding: EdgeInsets.only(right: 20, bottom: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) =>
            DiseasesCard(diseasesAssets: diseasesList[index])),
      ),
    );
  }
}

class DiseasesCard extends StatelessWidget {
  final DiseasesAssets diseasesAssets;
  const DiseasesCard({Key? key, required this.diseasesAssets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double cardWidth = screenWidth * 0.8;
    double cardHeight = cardWidth * 0.57;
    return GestureDetector(
      onTap: () async {
        int res = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ExplainDisease(
                          diseasesAssets: diseasesAssets,
                        ))) ??
            0;
        HoldValues.notificationClicked = true;
        if (res == 1) {
          Navigator.pop(context, 1);
        }
      },
      child: Container(
          width: cardWidth,
          height: cardHeight - 30,
          margin: EdgeInsets.only(
            left: 20,
          ),
          child: Stack(
            children: [
              Positioned.fill(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  diseasesAssets.image,
                  fit: BoxFit.cover,
                ),
              )),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: cardHeight - 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
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
                  child: Container(
                    width: cardWidth,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: AutoSizeText(
                      diseasesAssets.title,
                      style: TextStyle(
                          fontFamily: kPrimaryFont,
                          fontSize: 20,
                          color: Colors.white),
                      maxLines: 2,
                    ),
                  ))
            ],
          )),
    );
  }
}

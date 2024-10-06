import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';

////////// -- The desription of Nutrient -- //////////////
class DescriptoinTheNutrient extends StatelessWidget {
  final nutrientName;
  final howImportant;
  const DescriptoinTheNutrient({
    Key? key,
    required this.howImportant,
    this.nutrientName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                      style: TextStyle(
                          fontFamily: kPrimaryFont, color: Colors.black),
                      children: [
                    TextSpan(
                        text: "أهمية $nutrientName \n",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    TextSpan(text: howImportant, style: TextStyle(fontSize: 16))
                  ])),
              SizedBox(
                height: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}

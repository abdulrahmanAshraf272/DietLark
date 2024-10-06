import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/NutrientsAssets.dart';
import 'package:food_app/models/ads_test/interstitial_ad_model.dart';
import 'package:food_app/models/description.dart';
import 'package:food_app/screens/display_references/display_references_screen.dart';
import 'package:food_app/screens/explain_nutrient/components/header_and_title.dart';
import 'package:food_app/size_config.dart';

import 'description_nutrient.dart';
import 'nutrient_source_button.dart';

class Body extends StatefulWidget {
  final NutrientsAssets nutrientsAssets;
  const Body({Key? key, required this.nutrientsAssets}) : super(key: key);

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
    final nutrientName = widget.nutrientsAssets.title;
    var statebarHeight = MediaQuery.of(context).viewPadding.top;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      child: Column(
        children: [
          Stack(children: [
            HeaderAndTitle(
              nutrientColor: widget.nutrientsAssets.nutrientColor,
              nutrientName: nutrientName,
            ),
            GoBackArrow(),
            GoToReferences(references: widget.nutrientsAssets.sources)
          ]),
          DescriptoinTheNutrient(
            howImportant: widget.nutrientsAssets.description,
            nutrientName: nutrientName,
          ),
          NutrientSourcesButton(
            nutrientName: nutrientName,
            theColor: widget.nutrientsAssets.nutrientColor,
            theList: widget.nutrientsAssets.nutrientFood,
          )
        ],
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
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            )));
  }
}

class GoToReferences extends StatelessWidget {
  const GoToReferences({
    Key? key,
    required this.references,
  }) : super(key: key);

  final String references;

  @override
  Widget build(BuildContext context) {
    var statebarHeight = MediaQuery.of(context).viewPadding.top;
    return Positioned(
      left: 10,
      top: statebarHeight + 12,
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DisplayReferences(references: references))),
        child: Row(
          children: [
            Text("المراجع",
                style: TextStyle(
                    fontFamily: kPrimaryFont,
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9))),
            SizedBox(
              width: 2,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white.withOpacity(0.9),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

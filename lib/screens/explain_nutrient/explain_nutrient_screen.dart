import 'package:flutter/material.dart';
import 'package:food_app/models/NutrientsAssets.dart';
import 'package:food_app/screens/explain_nutrient/components/body.dart';

class ExplainNutrient extends StatelessWidget {
  final NutrientsAssets nutrientsAssets;
  const ExplainNutrient({Key? key, required this.nutrientsAssets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        nutrientsAssets: nutrientsAssets,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/RecipeAssets.dart';
import 'package:food_app/screens/display_recipe/components/body.dart';

class DisplayRecipe extends StatelessWidget {
  final RecipeAssets recipeAssets;
  const DisplayRecipe({Key? key, required this.recipeAssets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: Scaffold(
        body: Body(recipeAssets: recipeAssets),
      ),
    );
  }
}

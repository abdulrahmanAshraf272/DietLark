import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/models/RecipeAssets.dart';
import 'package:food_app/models/RecipesC.dart';
import 'package:food_app/screens/display_recipe/display_recipe_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';

class RecipeCard extends StatelessWidget {
  final RecipeAssets recipeAssets;
  const RecipeCard({Key? key, required this.recipeAssets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DisplayRecipe(
                        recipeAssets: recipeAssets,
                      )));
          HoldValues.notificationClicked = true;
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [kDefaultShadow],
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage(recipeAssets.image),
                        fit: BoxFit.cover)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              child: AutoSizeText(recipeAssets.name,
                  style: TextStyle(fontSize: 18, fontFamily: kSecondaryFont),
                  maxLines: 1),
            )
          ],
        ),
      ),
    );
  }
}

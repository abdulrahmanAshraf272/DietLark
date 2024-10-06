import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/KitchenAssets.dart';
import 'package:food_app/models/RecipeAssets.dart';
import 'package:food_app/size_config.dart';
import 'package:food_app/screens/display_recipe/display_recipe_screen.dart';

List theList = mainDishesList;

class Body extends StatelessWidget {
  const Body({Key? key, required this.categorySelected}) : super(key: key);

  final int categorySelected;

  @override
  Widget build(BuildContext context) {
    if (categorySelected == 0) {
      theList = mainDishesList;
    } else if (categorySelected == 1) {
      theList = sideDishesList;
    } else if (categorySelected == 2) {
      theList = dessertsRecipesList;
    } else if (categorySelected == 3) {
      theList = breakfastDishesList;
    } else {
      theList = sosDishesList;
    }
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: theList.length,
      padding: EdgeInsets.only(bottom: 30),
      scrollDirection: Axis.vertical,
      itemBuilder: ((context, index) =>
          RecipeCard(recipeAssets: theList[index])),
    );
  }
}

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    Key? key,
    required this.recipeAssets,
  }) : super(key: key);

  final RecipeAssets recipeAssets;

  @override
  Widget build(BuildContext context) {
    final _cardWidth = SizeConfig.screenWidth - 40;
    final _cardHeight = _cardWidth * 0.6;

    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DisplayRecipe(
                    recipeAssets: recipeAssets,
                  ))),
      child: Container(
        width: _cardWidth,
        height: _cardHeight - 30,
        margin: EdgeInsets.only(top: 20, right: 15, left: 15),
        child: Stack(
          children: [
            Positioned.fill(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                recipeAssets.image,
                fit: BoxFit.cover,
              ),
            )),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: _cardHeight * 0.3,
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
                right: 15,
                child: Container(
                  width: _cardWidth,
                  padding: EdgeInsets.only(left: 20),
                  child: AutoSizeText(
                    recipeAssets.name,
                    style: TextStyle(
                        fontFamily: kPrimaryFont,
                        fontSize: 20,
                        color: Colors.white),
                    maxLines: 2,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

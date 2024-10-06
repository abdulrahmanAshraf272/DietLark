import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/models/RecipeAssets.dart';
import 'package:food_app/models/RecipesC.dart';
import 'package:food_app/screens/recipes/components/recipe_card.dart';

class RecipesCarousel extends StatefulWidget {
  const RecipesCarousel({Key? key, required this.theList}) : super(key: key);

  final List theList;

  @override
  State<RecipesCarousel> createState() => _RecipesCarouselState();
}

class _RecipesCarouselState extends State<RecipesCarousel> {
  late PageController _pageController;
  int initialPage = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
        //so that we can have small portion show on lift and right.
        viewportFraction: 0.8,
        //by default out recipe
        initialPage: initialPage);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
          aspectRatio: 1.6,
          child: PageView.builder(
              onPageChanged: ((value) {
                setState(() {
                  initialPage = value;
                });
              }),
              controller: _pageController,
              itemCount: widget.theList.length,
              itemBuilder: ((context, index) => buildRecipeSlider(index)))),
    );
  }

  Widget buildRecipeSlider(int index) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 0;
          if (_pageController.position.haveDimensions) {
            value = index - _pageController.page!.toDouble();
            // we use 0.038 because 180 * 0.038 = 7 almost and we need to rotate
            //our card 7 degree.
            //we clamp so that our value vary from -1 to 1
            value = (value * -0.039).clamp(-1, 1);
          }
          return AnimatedOpacity(
            duration: Duration(milliseconds: 200),
            opacity: initialPage == index ? 1 : 0.6,
            child: Transform.rotate(
                angle: math.pi * value,
                child: RecipeCard(recipeAssets: widget.theList[index])),
          );
        },
      );
}

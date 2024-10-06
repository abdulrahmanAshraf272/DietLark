import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/RecipeAssets.dart';
import 'package:food_app/models/RecipesC.dart';
import 'package:food_app/screens/all_recipes/all_recipes_screen.dart';
import 'package:food_app/screens/recipes/components/category_list.dart';
import 'package:food_app/size_config.dart';
import 'dart:math' as math;

import 'kitchensSection.dart';
import 'recipe_card.dart';
import 'recipe_carousel.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List theList = mainDishesList;
  int selectedCategory = 0;
  List<String> categories = [
    "أطباق رئيسية",
    "أطباق جانبية",
    "حلويات",
    "اطباق للإفطار",
    "صوصات",
  ];
  List<RecipeAssets> mainDishesListShuffled = mainDishesList;
  List<RecipeAssets> sideDishesListShuffled = sideDishesList;
  List<RecipeAssets> dessertsRecipesListShuffled = dessertsRecipesList;
  List<RecipeAssets> breakfastDishesListShuffled = breakfastDishesList;
  List<RecipeAssets> sosDishesListShuffled = sosDishesList;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    //To make the order of list change every time.
    mainDishesListShuffled.shuffle();
    sideDishesListShuffled.shuffle();
    dessertsRecipesListShuffled.shuffle();
    breakfastDishesListShuffled.shuffle();
    sosDishesListShuffled.shuffle();

    double _cardWidth = (screenWidth - 90) / 2;
    //You must use SingleChild .. in all pages in the app to perevent any
    //error in small devices.
    //and dont forget to cancel the glow
    return SafeArea(
      child: Container(
        width: screenWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/foodBackground.png"),
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopTitle(),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  ShowAll(
                    selectedCategory: 0,
                    title: "أطباق رئيسية",
                  ),
                  RecipesCarousel(
                    theList: mainDishesListShuffled,
                  ),
                  ShowAll(
                    selectedCategory: 1,
                    title: "أطباق جانبية",
                  ),
                  RecipesCarousel(
                    theList: sideDishesListShuffled,
                  ),
                  ShowAll(
                    selectedCategory: 2,
                    title: "حلويات",
                  ),
                  RecipesCarousel(
                    theList: dessertsRecipesListShuffled,
                  ),
                  ShowAll(
                    selectedCategory: 3,
                    title: "اطباق للإفطار",
                  ),
                  RecipesCarousel(
                    theList: breakfastDishesListShuffled,
                  ),
                  ShowAll(
                    selectedCategory: 4,
                    title: "صوصات",
                  ),
                  RecipesCarousel(
                    theList: sosDishesListShuffled,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TopTitle extends StatelessWidget {
  const TopTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              AutoSizeText(
                "وصفات أكلات",
                style: TextStyle(fontFamily: kPrimaryFont, fontSize: 23),
                maxLines: 1,
              ),
              AutoSizeText(
                "لذيذة و صحية",
                style: TextStyle(
                    fontFamily: kPrimaryFont,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
              ),
            ],
          ),
        )
      ],
    );
  }
}

/*
RecipesCarousel(
            theList: theList,
          ),
 */

class ShowAll extends StatelessWidget {
  const ShowAll({
    Key? key,
    required this.selectedCategory,
    required this.title,
  }) : super(key: key);

  final int selectedCategory;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    AllRecipes(categorySelected: selectedCategory)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: "CairoRegular",
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
            Spacer(),
            Container(
              height: 38,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.03),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text("عرض الكل",
                    style: TextStyle(
                        fontFamily: kPrimaryFont,
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.5))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



/* 
Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 60,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = index;
                      if (index == 0) {
                        theList = mainDishesList;
                      } else if (index == 1) {
                        theList = sideDishesList;
                      } else if (index == 2) {
                        theList = dessertsList;
                      } else if (index == 3) {
                        theList = breakfastDishesList;
                      } else {
                        theList = sosDishesList;
                      }
                      //i think here the work i must done to display the list.
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        categories[index],
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: kSecondaryFont,
                            color: index == selectedCategory
                                ? kTextColor2
                                : Colors.black.withOpacity(0.4)),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        height: 3,
                        width: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index == selectedCategory
                                ? kRedColor
                                : Colors.transparent),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          */

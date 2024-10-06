import 'package:flutter/material.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/models/ArticleAssets.dart';
import 'package:food_app/models/CategoriesAssets.dart';
import 'package:food_app/models/DietTypesAssets.dart';
import 'package:food_app/models/DiseasesAssets.dart';
import 'package:food_app/models/NutrientsAssets.dart';
import 'package:food_app/models/RecipeAssets.dart';
import 'package:food_app/models/RecipesNotiList.dart';
import 'package:food_app/models/SupplementsAssets.dart';
import 'package:food_app/models/food_categories_lists.dart';
import 'package:food_app/screens/articles_details/articles_details_screen.dart';
import 'package:food_app/screens/dietType_details/dietType_details_screen.dart';

import 'package:food_app/screens/display_recipe/display_recipe_screen.dart';
import 'package:food_app/screens/explain_disease/explain_disease_screen.dart';
import 'package:food_app/screens/explain_nutrient/explain_nutrient_screen.dart';
import 'package:food_app/screens/food_details/food_details_screen.dart';

import 'package:food_app/screens/supplement_details/supplement_details_screen.dart';

notificationNavigation(BuildContext context, var message) {
  try {
    //To display the add
    HoldValues.notificationClicked = true;
    //Get the info from data of the notification
    String type = message.data['type'];
    int index = int.parse(message.data['index']);
    String meal = message.data['meal'] ?? '';
    String section = message.data['section'] ?? '';

    if (type == 'n') {
      notificationNavToNutrient(context, index);
    } else if (type == 'a') {
      notificationNavToArticle(context, index);
    } else if (type == 's') {
      notificationNavToSupplement(context, index);
    } else if (type == 'd') {
      notificationNavToDiseas(context, index);
    } else if (type == 'r') {
      notificationNavToRecipe(context, meal, index);
    } else if (type == 'f') {
      notificationNavToFood(context, int.parse(section), index);
    } else if (type == 'dt') {
      notificationNavToDietTypes(context, index);
    }
  } catch (e) {
    print(e);
  }
}

notificationNavToNutrient(BuildContext context, int index) {
  HoldValues.mealSelected = 0;
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ExplainNutrient(
                nutrientsAssets: nutrientsList[index],
              )));
}

notificationNavToSupplement(BuildContext context, int index) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              SupplementDetails(supplementsAssets: supplementsList[index])));
}

notificationNavToArticle(BuildContext context, int index) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ArticlesDetails(articleAssets: articlesList[index])));
}

notificationNavToDiseas(BuildContext context, int index) {
  HoldValues.mealSelected = 0;
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ExplainDisease(diseasesAssets: diseasesList[index])));
}

notificationNavToDietTypes(BuildContext context, int index) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              DietTypeDetails(dietTypesAssets: dietTypesList[index])));
}

notificationNavToRecipe(BuildContext context, String meal, int index) {
  List<RecipeAssets> theMealList;
  if (meal == 'main') {
    theMealList = mainDishesListNoti;
  } else if (meal == 'side') {
    theMealList = sideDishesListNoti;
  } else if (meal == 'breakfast') {
    theMealList = breakfastDishesListNoti;
  } else if (meal == 'sos') {
    theMealList = sosDishesListNoti;
  } else {
    theMealList = dessertsRecipesListNoti;
  }
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DisplayRecipe(
                recipeAssets: theMealList[index],
              )));
}

notificationNavToFood(BuildContext context, int section, int index) {
  HoldValues.mealSelected = 0;
  HoldValues.isAdding = 1;
  var foodData = categoriesAssetsList[section].sectionList[index];
  //var foodData2 = categoriesAssets;
  //var foodData = meatsList[0];
  HoldValues.amountScaleS = foodData.amountScale;
  HoldValues.calories = foodData.calories;
  HoldValues.protein = foodData.protein;
  HoldValues.fat = foodData.fat;
  HoldValues.carb = foodData.carb;
  HoldValues.foodImage = foodData.image;
  HoldValues.foodDesc = foodData.description;
  HoldValues.foodTitle = foodData.title;
  HoldValues.isAdding = 1;
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => FoodDetails()));
}

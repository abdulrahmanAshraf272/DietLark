import 'package:food_app/constants.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class HoldValues {
  static int amountScaleS = 1;
  static int calories = 0;
  static double protein = 0, carb = 0, fat = 0;
  static int mealSelected = 0;
  static int stopCalc = 0;
  static int isAdding = 1;
  static String foodImage = "";
  static String foodDesc = "";
  static String foodTitle = "";
  static int foodAmount = 100;
  static int foodId = 1;

  static int theDishesListNo = 0;

  static late String USER_FIRST_NAME = "";
  static String USER_SECOND_NAME = "";

  static int USER_AGE = 0;
  static int USER_GENDER = 0;
  static int USER_HEIGHT = 0;
  static double USER_WEIGHT = 0;
  static int USER_GOAL = 0;
  static int USER_DIET_TYPE = 0;
  static double USER_ACTIVITY = 0;
  static bool USER_HAVE_DIET = false;
  static String USER_ACCOUNT = '';
  static int RATE_COUNTER = 0;

  static bool notificationClicked = false;

  static bool isSignUpOperation = true;

  static int PREMIUM_ACCOUNT = 0;

  static bool firstTime = true;

  static bool isEditingDiet = false;

  static int notificationDirection = 1;

  static int USER_CALORIES_MAIN = 0;
  static int USER_CALORIES_INTAKE = 0;
  static int USER_PROTEIN_INTAKE = 0;
  static int USER_CARB_INTAKE = 0;
  static int USER_FAT_INTAKE = 0;

  static int MEAL_HOUR = 9;
  static int MEAL_MIN = 30;

  static final DATABASE_NAME = "notes";
  static final ID = "id";
  static final NAME = "name";
  static final IS_RECIPE = "isRecipe";
  static final INGREDIENTS = "ingredients";
  static final PREPARE = "prepare";
  static final COOKING_TIME = "cookingTime";
  static final RECIPE_MEALS_NO = "recipeMealsNo";
  static final DESC = "desc";
  static final IMAGE = "image";
  static final AMOUNT = "amount";
  static final AMOUNT_TYPE = "amountType";
  static final CALORIES = "calories";
  static final PROTEIN = "protein";
  static final FAT = "fat";
  static final CARB = "carb";
  static final MEAL_NO = "mealNo";

  static String amountFormMethod(int amountTypeNumber) {
    String amount = "";
    if (amountTypeNumber == gramAmount) {
      amount = gramString;
    } else if (amountTypeNumber == mediumAmount) {
      amount = mediumString;
    } else if (amountTypeNumber == sponAmount) {
      amount = sponString;
    } else if (amountTypeNumber == cupAmount) {
      amount = cupString;
    } else {
      amount = mealString;
    }
    return amount;
  }

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}

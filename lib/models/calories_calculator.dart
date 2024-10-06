import 'dart:ffi';

import 'package:food_app/constants.dart';
import 'package:food_app/models/calories_and_macros.dart';

class CaloriesCalculator {
  int calories = 0, amountScale = 0;
  double protein = 0, fat = 0, carb = 0;

  CaloriesAndMacros calculateCalories(
      final CaloriesAndMacros caloriesAndMacros, int amount) {
    CaloriesAndMacros newValues = new CaloriesAndMacros();
    if (caloriesAndMacros.amountScale == gramAmount) {
      //Gram amount calculation
      double p, f, c;
      newValues.calories =
          ((amount / 100) * caloriesAndMacros.calories).round();
      p = ((amount / 100) * caloriesAndMacros.protein);
      f = ((amount / 100) * caloriesAndMacros.fat);
      c = ((amount / 100) * caloriesAndMacros.carb);
      //rounding ex: 5.325 > 5.3
      newValues.protein = double.parse(p.toStringAsFixed(1));
      newValues.fat = double.parse(f.toStringAsFixed(1));
      newValues.carb = double.parse(c.toStringAsFixed(1));
    } else {
      double p, f, c;
      newValues.calories = (amount * caloriesAndMacros.calories);
      p = (amount * caloriesAndMacros.protein);
      f = (amount * caloriesAndMacros.fat);
      c = (amount * caloriesAndMacros.carb);
      //rounding ex: 5.325 > 5.3
      newValues.protein = double.parse(p.toStringAsFixed(1));
      newValues.fat = double.parse(f.toStringAsFixed(1));
      newValues.carb = double.parse(c.toStringAsFixed(1));
    }
    return newValues;
  }
}

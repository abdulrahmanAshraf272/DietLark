import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_app/sqldb.dart';

class DatabaseOperations {
  Future signUpSetValues(
      String firstName, String secondName, int gender) async {
    // ==== Set values in shared preferences ==== //
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(KEY_FIRST_NAME, firstName);
    prefs.setString(KEY_SECOND_NAME, secondName);
    prefs.setInt(KEY_GENDER, gender);

    prefs.setBool(KEY_FIRST_TIME_USE, false);
    prefs.setInt(KEY_PREMIUM, 0);

    print('======= adding user info in SharedPreferences is DONE! =======');

    // ==== Set values in HoldVaues file ==== //
    HoldValues.USER_FIRST_NAME = firstName;
    HoldValues.USER_SECOND_NAME = secondName;
    HoldValues.USER_GENDER = gender;

    HoldValues.firstTime = false;
    HoldValues.PREMIUM_ACCOUNT = 0;

    print('======= adding user info in HoldValues is DONE! =======');

    // ==== Set values in Firebase cloud ==== //
    final db = await FirebaseFirestore.instance;
    final user = await FirebaseAuth.instance.currentUser;

    if (user != null) {
      final email = user.email ?? '';
      print(user.email);
      prefs.setString(KEY_ACCOUNT_NAME, email);
      HoldValues.USER_ACCOUNT = email;
      final userInfo = {
        KEY_FIRST_NAME: firstName,
        KEY_SECOND_NAME: secondName,
        KEY_GENDER: gender,
        KEY_PREMIUM: 0,
        KEY_HAVE_DIET: false
      };
      try {
        db
            .collection('users')
            .doc(user.uid)
            .set(userInfo, SetOptions(merge: true))
            .onError((e, _) => print("Error writing document: $e"));
      } catch (e) {
        print('firebase does not saved the data');
      }

      print('======= adding user info in Firebase is DONE! =======');
    } else {
      print('no account id');
    }
  }

  Future editUserInfo(String firstName, String secondName, int gender) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(KEY_FIRST_NAME, firstName);
    prefs.setString(KEY_SECOND_NAME, secondName);
    prefs.setInt(KEY_GENDER, gender);
    print('======= edit user info in SharedPreferences is DONE! =======');

    HoldValues.USER_FIRST_NAME = firstName;
    HoldValues.USER_SECOND_NAME = secondName;
    HoldValues.USER_GENDER = gender;
    print('======= edit user info in HoldValues is DONE! =======');
    // ==== Set values in Firebase cloud ==== //
    final db = await FirebaseFirestore.instance;
    final user = await FirebaseAuth.instance.currentUser;

    if (user != null) {
      final userInfo = {
        KEY_FIRST_NAME: firstName,
        KEY_SECOND_NAME: secondName,
        KEY_GENDER: gender,
      };
      db
          .collection('users')
          .doc(user.uid)
          .set(userInfo, SetOptions(merge: true))
          .onError((e, _) => print("Error writing document: $e"));
      print('======= edit user info in Firebase is DONE! =======');
    } else {
      print('no account id');
    }
  }

  Future getUserInfoFromSharedPref() async {
    // ==== Get user data from SharedPrefereneces ==== //
    SharedPreferences prefs = await SharedPreferences.getInstance();
    HoldValues.firstTime = prefs.getBool(KEY_FIRST_TIME_USE) ?? true;
    HoldValues.PREMIUM_ACCOUNT = prefs.getInt(KEY_PREMIUM) ?? 0;
    HoldValues.USER_HAVE_DIET = prefs.getBool(KEY_HAVE_DIET) ?? false;
    print(prefs.getBool(KEY_HAVE_DIET));

    if (HoldValues.firstTime == false) {
      HoldValues.USER_FIRST_NAME = prefs.getString(KEY_FIRST_NAME) ?? '';
      HoldValues.USER_SECOND_NAME = prefs.getString(KEY_SECOND_NAME) ?? '';
      HoldValues.USER_GENDER = prefs.getInt(KEY_GENDER) ?? 2;
      HoldValues.USER_ACCOUNT = prefs.getString(KEY_ACCOUNT_NAME) ?? '';
    }
    if (HoldValues.USER_HAVE_DIET) {
      HoldValues.USER_CALORIES_MAIN = prefs.getInt(KEY_CALORIES_MAIN) ?? 0;
      HoldValues.USER_CALORIES_INTAKE = prefs.getInt(KEY_CALORIES_INTAKE) ?? 0;
      HoldValues.USER_PROTEIN_INTAKE = prefs.getInt(KEY_PROTEIN_INTAKE) ?? 0;
      HoldValues.USER_CARB_INTAKE = prefs.getInt(KEY_CARB_INTAKE) ?? 0;
      HoldValues.USER_FAT_INTAKE = prefs.getInt(KEY_FAT_INTAKE) ?? 0;

      HoldValues.USER_AGE = prefs.getInt(KEY_AGE) ?? 0;
      HoldValues.USER_WEIGHT = prefs.getDouble(KEY_WEIGHT) ?? 0;
      HoldValues.USER_HEIGHT = prefs.getInt(KEY_HEIGHT) ?? 0;
      HoldValues.USER_ACTIVITY = prefs.getDouble(KEY_ACTIVITY) ?? 0;
      HoldValues.USER_GOAL = prefs.getInt(KEY_GOAL) ?? 0;
      HoldValues.USER_DIET_TYPE = prefs.getInt(KEY_DIET_TYPE) ?? 0;
    }

    ////// == Counter to display rate page ===//////
    if (prefs.getInt(KEY_RATE_COUNTER) == null) {
      HoldValues.RATE_COUNTER = 1;
      prefs.setInt(KEY_RATE_COUNTER, 1);
    } else if (prefs.getInt(KEY_RATE_COUNTER) == 1) {
      HoldValues.RATE_COUNTER = 2;
      prefs.setInt(KEY_RATE_COUNTER, 2);
    } else if (prefs.getInt(KEY_RATE_COUNTER) == 2) {
      HoldValues.RATE_COUNTER = 3;
      prefs.setInt(KEY_RATE_COUNTER, 3);
    }
    HoldValues.RATE_COUNTER = prefs.getInt(KEY_RATE_COUNTER) ?? 0;
    print('==== Getting user data from sharedPrefs is Done! ====');
  }

  Future loginGetUserInfo() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Get the user's first name and last name from Firestore
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      HoldValues.USER_FIRST_NAME = snapshot.data()?[KEY_FIRST_NAME];
      HoldValues.USER_SECOND_NAME = snapshot.data()?[KEY_SECOND_NAME];
      HoldValues.USER_GENDER = snapshot.data()?[KEY_GENDER];

      HoldValues.PREMIUM_ACCOUNT = snapshot.data()?[KEY_PREMIUM];
      print('test 1:${HoldValues.PREMIUM_ACCOUNT}');
      HoldValues.USER_HAVE_DIET = snapshot.data()?[KEY_HAVE_DIET];
      HoldValues.firstTime = false;
      print('==== getting user data from firebase is Done! ====');

      // == Adding user info in sharedPrefs == //
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(KEY_FIRST_NAME, HoldValues.USER_FIRST_NAME);
      prefs.setString(KEY_SECOND_NAME, HoldValues.USER_SECOND_NAME);
      prefs.setInt(KEY_GENDER, HoldValues.USER_GENDER);

      prefs.setBool(KEY_FIRST_TIME_USE, false);
      prefs.setInt(KEY_PREMIUM, HoldValues.PREMIUM_ACCOUNT);
      prefs.setString(KEY_ACCOUNT_NAME, HoldValues.USER_ACCOUNT);

      //If user have diet get his personal info to make him a diet.
      if (HoldValues.USER_HAVE_DIET) {
        HoldValues.USER_AGE = snapshot.data()?[KEY_AGE];
        HoldValues.USER_HEIGHT = snapshot.data()?[KEY_HEIGHT];
        HoldValues.USER_WEIGHT = snapshot.data()?[KEY_WEIGHT];
        HoldValues.USER_ACTIVITY = snapshot.data()?[KEY_ACTIVITY];
        HoldValues.USER_GOAL = snapshot.data()?[KEY_GOAL];
        HoldValues.USER_DIET_TYPE = snapshot.data()?[KEY_DIET_TYPE];

        dietPlanCalculations();

        //User body and age informations.
        prefs.setInt(KEY_AGE, HoldValues.USER_AGE);
        prefs.setInt(KEY_HEIGHT, HoldValues.USER_HEIGHT);
        prefs.setDouble(KEY_WEIGHT, HoldValues.USER_WEIGHT);
        prefs.setDouble(KEY_ACTIVITY, HoldValues.USER_ACTIVITY);
        prefs.setInt(KEY_GOAL, HoldValues.USER_GOAL);
        prefs.setInt(KEY_DIET_TYPE, HoldValues.USER_DIET_TYPE);
        //User Diet plan informations.
        prefs.setInt(KEY_CALORIES_MAIN, HoldValues.USER_CALORIES_MAIN);
        prefs.setInt(KEY_CALORIES_INTAKE, HoldValues.USER_CALORIES_INTAKE);
        prefs.setInt(KEY_PROTEIN_INTAKE, HoldValues.USER_PROTEIN_INTAKE);
        prefs.setInt(KEY_CARB_INTAKE, HoldValues.USER_CARB_INTAKE);
        prefs.setInt(KEY_FAT_INTAKE, HoldValues.USER_FAT_INTAKE);

        print('==== getting user data and make diet for him is Done! ====');
      }

      print('==== loging and get user sucessfully Done!');
    }
  }

  Future setUserBodyDataFirebase() async {
    // ==== Set values in Firebase cloud ==== //
    final db = await FirebaseFirestore.instance;
    final user = await FirebaseAuth.instance.currentUser;

    if (user != null) {
      final userInfo = {
        KEY_HAVE_DIET: true,
        KEY_AGE: HoldValues.USER_AGE,
        KEY_HEIGHT: HoldValues.USER_HEIGHT,
        KEY_WEIGHT: HoldValues.USER_WEIGHT,
        KEY_ACTIVITY: HoldValues.USER_ACTIVITY,
        KEY_GOAL: HoldValues.USER_GOAL,
        KEY_DIET_TYPE: HoldValues.USER_DIET_TYPE,
      };
      db
          .collection('users')
          .doc(user.uid)
          .set(userInfo, SetOptions(merge: true))
          .onError((e, _) => print("Error writing document: $e"));
      print('======= adding user info in Firebase is DONE! =======');
    } else {
      print('no account id');
    }
  }

  logoutCleanData() async {
    HoldValues.firstTime = true;
    SqlDb sqlDb = SqlDb();

    HoldValues.USER_HAVE_DIET = false;
    HoldValues.USER_ACCOUNT = '';
    HoldValues.PREMIUM_ACCOUNT = 0;
    HoldValues.firstTime = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(KEY_FIRST_TIME_USE, true);
    prefs.setInt(KEY_PREMIUM, HoldValues.PREMIUM_ACCOUNT);
    prefs.setString(KEY_ACCOUNT_NAME, HoldValues.USER_ACCOUNT);
    prefs.setBool(KEY_HAVE_DIET, HoldValues.USER_HAVE_DIET);
    int response = await sqlDb.deleteAllMeals();
  }

  dietPlanCalculations() {
    //Make diet for him and save his intakes.
    double BMR;
    int caloriesMain, caloriesIntake, proteinIntake, carbIntake, fatIntake;
    int gender = HoldValues.USER_GENDER;
    int age = HoldValues.USER_AGE;
    int height = HoldValues.USER_HEIGHT;
    double weight = HoldValues.USER_WEIGHT;
    double activityRate = HoldValues.USER_ACTIVITY;
    int goal = HoldValues.USER_GOAL;
    int dietType = HoldValues.USER_DIET_TYPE;
    //Calculate the BMR according to mifflin equation.
    if (gender == 1) {
      BMR = (10 * weight) + (6.25 * height) - (5 * age) + 5;
    } else {
      BMR = (10 * weight) + (6.25 * height) - (5 * age) - 161;
    }
    //Calculate the calories intake;
    caloriesMain = (activityRate * BMR).round();
    if (goal == GAIN_WEIGHT) {
      caloriesIntake = caloriesMain + 300;
    } else if (goal == LOSS_WEIGHT) {
      caloriesIntake = caloriesMain - 500;
    } else {
      caloriesIntake = caloriesMain;
    }

    //Calculate the Macros intake
    //== Get the macros percent accroding to diet type==//
    double proteinPercentage;
    double carbPercentage;
    double fatPercentage;
    if (dietType == BALANCED_DIET) {
      proteinPercentage = BALANCED_PP;
      carbPercentage = BALANCED_CP;
      fatPercentage = BALANCED_FP;
    } else if (dietType == LOW_CARB_DIET) {
      proteinPercentage = LOW_CARB_PP;
      carbPercentage = LOW_CARB_CP;
      fatPercentage = LOW_CARB_FP;
    } else {
      proteinPercentage = KETO_PP;
      carbPercentage = KETO_CP;
      fatPercentage = KETO_FP;
    }
    //==Get what method i well use according to the goal==//
    if (goal == LOSS_WEIGHT) {
      proteinIntake = ((proteinPercentage * caloriesIntake) / 4).round();
      carbIntake = ((carbPercentage * caloriesIntake) / 4).round();
      fatIntake = ((fatPercentage * caloriesIntake) / 9).round();
    } else {
      proteinIntake = (proteinPerWeightNum * weight).round();
      fatIntake = ((fatPercentage * caloriesIntake) / 9).round();
      carbIntake =
          ((caloriesIntake - proteinIntake * 4 - fatIntake * 9) / 4).round();
    }

    //Save in HoldValues.
    HoldValues.USER_CALORIES_MAIN = caloriesMain;
    HoldValues.USER_CALORIES_INTAKE = caloriesIntake;
    HoldValues.USER_PROTEIN_INTAKE = proteinIntake;
    HoldValues.USER_CARB_INTAKE = carbIntake;
    HoldValues.USER_FAT_INTAKE = fatIntake;
  }
}

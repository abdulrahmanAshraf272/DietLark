import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/diets_main/components/body.dart';

//This page is have 1- profileCard, 2- Diets types, 3-supplements 4- articles.

class DietMain extends StatelessWidget {
  const DietMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}

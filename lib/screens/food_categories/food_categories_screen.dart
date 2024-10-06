import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/food_categories/components/body.dart';
import 'package:food_app/size_config.dart';

class FoodCategories extends StatelessWidget {
  const FoodCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ScrollConfiguration(
        behavior: MyBehavior(),
        child: Scaffold(backgroundColor: Color(0xFFfefefe), body: Body()));
  }
}

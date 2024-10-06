import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/FoodData.dart';
import 'package:food_app/screens/food_details/components/body.dart';
import 'package:food_app/size_config.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: Scaffold(
          body: Body(),
        ),
      ),
    );
  }
}

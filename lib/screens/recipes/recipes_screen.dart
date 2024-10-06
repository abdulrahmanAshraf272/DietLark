import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/recipes/components/body.dart';

class Recipes extends StatelessWidget {
  const Recipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: Scaffold(
        body: Body(),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          )),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/myDiet/components/body.dart';

class MyDiet extends StatelessWidget {
  const MyDiet({Key? key}) : super(key: key);

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

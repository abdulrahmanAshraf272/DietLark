import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/DietTypesAssets.dart';
import 'package:food_app/screens/dietType_details/components/body.dart';

class DietTypeDetails extends StatelessWidget {
  final DietTypesAssets dietTypesAssets;
  const DietTypeDetails({Key? key, required this.dietTypesAssets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: Scaffold(
        body: Body(
          dietTypesAssets: dietTypesAssets,
        ),
      ),
    );
  }
}

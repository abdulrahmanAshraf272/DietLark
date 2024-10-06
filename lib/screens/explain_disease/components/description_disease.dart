import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/DiseasesAssets.dart';
import 'package:food_app/size_config.dart';

class DescriptionDisease extends StatelessWidget {
  final DiseasesAssets diseasesAssets;
  const DescriptionDisease({
    Key? key,
    required this.diseasesAssets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            diseasesAssets.description,
            style: TextStyle(fontFamily: kPrimaryFont, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

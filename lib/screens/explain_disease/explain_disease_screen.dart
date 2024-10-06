import 'package:flutter/material.dart';
import 'package:food_app/models/DiseasesAssets.dart';
import 'package:food_app/screens/explain_disease/components/body.dart';

class ExplainDisease extends StatelessWidget {
  final DiseasesAssets diseasesAssets;
  const ExplainDisease({Key? key, required this.diseasesAssets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Body(
          diseasesAssets: diseasesAssets,
        ),
      ),
    );
  }
}

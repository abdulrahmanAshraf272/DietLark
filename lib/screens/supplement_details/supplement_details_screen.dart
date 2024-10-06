import 'package:flutter/material.dart';
import 'package:food_app/models/SupplementsAssets.dart';
import 'package:food_app/screens/supplement_details/components/body.dart';

class SupplementDetails extends StatelessWidget {
  const SupplementDetails({Key? key, required this.supplementsAssets})
      : super(key: key);
  final SupplementsAssets supplementsAssets;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        supplementsAssets: supplementsAssets,
      ),
    );
  }
}

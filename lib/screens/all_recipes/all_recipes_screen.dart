import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/KitchenAssets.dart';
import 'package:food_app/models/food_categories_lists.dart';
import 'package:food_app/screens/all_recipes/components/body.dart';

class AllRecipes extends StatelessWidget {
  const AllRecipes({Key? key, required this.categorySelected})
      : super(key: key);

  final int categorySelected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        categorySelected: categorySelected,
      ),
      appBar: buildAppBar(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 1,
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff333333),
          )),
      title: Text(
        categorySelected == 0
            ? "أطباق رئيسية"
            : categorySelected == 1
                ? "أطباق جانبية"
                : categorySelected == 2
                    ? "حلويات"
                    : categorySelected == 3
                        ? "اطباق للافطار"
                        : "صوصات",
        style: TextStyle(
            fontFamily: kPrimaryFont, fontSize: 16, color: Color(0xff333333)),
      ),
    );
  }
}

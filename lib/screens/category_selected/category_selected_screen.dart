import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/CategoriesAssets.dart';
import 'package:food_app/screens/category_selected/components/body.dart';

class CategorySelected extends StatelessWidget {
  final List theList;
  final String theTitle;
  final theColor;

  const CategorySelected(
      {Key? key,
      required this.theList,
      required this.theTitle,
      this.theColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: Scaffold(
          appBar: buildAppBar(context),
          body: Body(
            theList: theList,
          )),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 1,
      backgroundColor: theColor,
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: theColor == Colors.white ? Color(0xff333333) : Colors.white,
          )),
      title: Text(
        theTitle,
        style: TextStyle(
            fontFamily: kPrimaryFont,
            fontSize: 16,
            color: theColor == Colors.white ? Color(0xff333333) : Colors.white),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/screens/food_categories/food_categories_screen.dart';
import 'package:food_app/screens/mealDetails/components/body.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ////== This funtion to override the backButton.
    Future<bool> _onWillPop() async {
      Navigator.pop(context, 1);
      return true;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: Scaffold(
          body: Body(),
          appBar: buildAppBar(context),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Color(0xff333333),
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FoodCategories()));
              }),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    int mealNo = HoldValues.mealSelected;
    Color theColor = Colors.white;
    return AppBar(
      centerTitle: true,
      elevation: 1,
      backgroundColor: Color(0xFF334632),
      leading: IconButton(
          onPressed: () => Navigator.pop(context, 1),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )),
      title: Text(
        mealNo == 1
            ? "وجبة الإفطار"
            : mealNo == 2
                ? "وجبة الغداء"
                : mealNo == 3
                    ? "وجبة العشاء"
                    : "سناكس",
        style: TextStyle(
            fontFamily: kPrimaryFont, fontSize: 16, color: Colors.white),
      ),
    );
  }
}

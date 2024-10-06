import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedCategory = 0;
  List<String> categories = [
    "أطباق رئيسية",
    "أطباق جانبية",
    "حلويات",
    "سلطات",
    "معجنات",
    "شوربات",
    "مقبلات",
    "وجبات أطفال",
    "سندويتشات",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = index;
                //i think here the work i must done to display the list.
              });
            },
            child: Column(
              children: [
                Text(
                  categories[index],
                  style: TextStyle(
                      fontSize: 18,
                      color: index == selectedCategory
                          ? kTextColor2
                          : Colors.black.withOpacity(0.4)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  height: 4,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: index == selectedCategory
                          ? kRedColor
                          : Colors.transparent),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding itemList(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = index;
            //i think here the work i must done to display the list.
          });
        },
        child: Column(
          children: [
            Text(
              categories[index],
              style: TextStyle(
                  fontSize: 18,
                  color: index == selectedCategory
                      ? kTextColor2
                      : Colors.black.withOpacity(0.4)),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              height: 4,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: index == selectedCategory
                      ? kRedColor
                      : Colors.transparent),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/models/CategoriesAssets.dart';
import 'package:food_app/screens/category_selected/category_selected_screen.dart';
import 'package:food_app/screens/food_categories/components/diseases_cards.dart';
import 'package:food_app/screens/premium_pages/cash_or_share/cash_or_share_screen.dart';
import 'package:food_app/screens/search_page/search_page_screen.dart';
import 'package:food_app/size_config.dart';

import 'header_with_search.dart';
import 'kinds_of_food.dart';
import 'nutrients_section.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statebarHeight = MediaQuery.of(context).viewPadding.top;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SafeArea(child: Container()),
        IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios)),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Container(
            width: screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "السعرات الحرارية",
                  style: TextStyle(fontFamily: kPrimaryFont, fontSize: 21),
                  maxLines: 1,
                ),
                AutoSizeText(
                  "والقيم الغذائية للأطعمة",
                  style: TextStyle(
                      fontFamily: kPrimaryFont,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        SearchBox(),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spaceBetweenSections(),
                SectionTitle(title: "قائمة الأطعمة"),
                KindsOfFood(),
                spaceBetweenSections(),
                SectionTitle(title: "أهم العناصر الغذائية"),
                NutrientsSection(),
                spaceBetweenSections(),
                SectionTitle(title: "الوقاية والعلاج"),
                DiseasesSection()
              ],
            ),
          ),
        )
      ],
    );
  }

  SizedBox spaceBetweenSections() {
    return SizedBox(
      height: 15,
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () async {
        if (HoldValues.PREMIUM_ACCOUNT != 0) {
          int res = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage())) ??
              0;
          if (res == 1) {
            Navigator.pop(context);
          }
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CashOrShare()));
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        width: screenWidth,
        height: 54,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            boxShadow: []),
        child: Row(
          children: [
            Expanded(
                child: Text(
              "مثال: البيض , صدور الدجاج",
              style: TextStyle(
                  color: kTextColor.withOpacity(0.5),
                  fontFamily: kPrimaryFont,
                  fontSize: 16),
            )),
            HoldValues.PREMIUM_ACCOUNT != 0
                ? SizedBox(
                    width: 0,
                  )
                : Icon(
                    Icons.lock,
                    color: Colors.black.withOpacity(0.2),
                  ),
            SvgPicture.asset(
              "assets/icons/search.svg",
              color: kTextColor.withOpacity(0.5),
            )
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          fontFamily: "CairoRegular",
          fontWeight: FontWeight.bold,
          fontSize: 19,
        ),
      ),
    );
  }
}

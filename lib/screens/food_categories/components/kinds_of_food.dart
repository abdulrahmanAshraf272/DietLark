import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/hold_values.dart';
import 'package:food_app/models/CategoriesAssets.dart';
import 'package:food_app/screens/category_selected/category_selected_screen.dart';
import 'package:food_app/screens/premium_pages/cash_or_share/cash_or_share_screen.dart';
import 'package:food_app/size_config.dart';

//////////////////- Recomanded plants -//////////////////
class KindsOfFood extends StatelessWidget {
  const KindsOfFood({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double cardWidth = (screenWidth - 90) / 2;
    return SizedBox(
      height: cardWidth + 25,
      child: ListView.builder(
        padding: EdgeInsets.only(right: 20, bottom: 20),
        itemCount: categoriesAssetsList.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: ((context, index) => KindsOfFoodCard(
              categoriesAssets: categoriesAssetsList[index],
            )),
      ),
    );
  }
}

class KindsOfFoodCard extends StatelessWidget {
  final CategoriesAssets categoriesAssets;

  const KindsOfFoodCard({Key? key, required this.categoriesAssets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double cardWidth = (screenWidth - 90) / 2;
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 20, top: 5),
      height: cardWidth + 25,
      width: cardWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 8,
              color: Colors.black45.withOpacity(0.23)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              if (HoldValues.PREMIUM_ACCOUNT == 0 && categoriesAssets.id > 3) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CashOrShare()));
              } else {
                int res = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategorySelected(
                                  theList: categoriesAssets.sectionList,
                                  theTitle: categoriesAssets.title,
                                ))) ??
                    0;
                if (res == 1) {
                  Navigator.pop(context);
                }
              }
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 10, right: 10, left: 10, top: 5),
              child: Stack(
                children: [
                  HoldValues.PREMIUM_ACCOUNT == 0 && categoriesAssets.id > 3
                      ? Positioned(
                          top: 3,
                          right: 3,
                          child: Icon(
                            Icons.lock,
                            size: 17,
                            color: Colors.black.withOpacity(0.2),
                          ))
                      : SizedBox(),
                  Positioned.fill(
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            categoriesAssets.image,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        AutoSizeText(
                          categoriesAssets.title,
                          maxLines: 1,
                          style:
                              TextStyle(fontFamily: kPrimaryFont, fontSize: 21),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

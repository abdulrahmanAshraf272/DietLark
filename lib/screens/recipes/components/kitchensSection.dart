import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/models/KitchenAssets.dart';
import 'package:food_app/screens/all_recipes/all_recipes_screen.dart';
import 'package:food_app/size_config.dart';

class KitchensSection extends StatelessWidget {
  const KitchensSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _cardWidth = (SizeConfig.screenWidth) * 0.75;
    double _cardHeight = _cardWidth * 0.5;
    return SizedBox(
      height: _cardHeight,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: kitchensList.length,
        padding: EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) => KitchenCard(
              kitchenAssets: kitchensList[index],
            )),
      ),
    );
  }
}

class KitchenCard extends StatelessWidget {
  const KitchenCard({
    Key? key,
    required this.kitchenAssets,
  }) : super(key: key);
  final KitchenAssets kitchenAssets;

  @override
  Widget build(BuildContext context) {
    double _cardWidth = (SizeConfig.screenWidth) * 0.75;
    double _cardHeight = _cardWidth * 0.5;
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AllRecipes(
                    categorySelected: 1,
                  ))),
      child: Container(
        width: _cardWidth,
        height: _cardHeight,
        margin: EdgeInsets.only(right: 20, bottom: 20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  kitchenAssets.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            Positioned(
              child: Center(
                child: Text(
                  kitchenAssets.name,
                  style: TextStyle(
                      fontFamily: kFontDGSahabah,
                      fontSize: 30,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

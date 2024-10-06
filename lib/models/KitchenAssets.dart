import 'package:food_app/models/RecipeAssets.dart';

class KitchenAssets {
  int id;
  String name, image;
  List theList;

  KitchenAssets(
      {required this.id,
      required this.name,
      required this.image,
      required this.theList});
}

List<KitchenAssets> kitchensList = [
  KitchenAssets(
      id: 1,
      name: "المطبخ الصيني",
      image: "assets/images/recipe5.jpg",
      theList: chineseKitchenList),
  KitchenAssets(
      id: 1,
      name: "المطبخ الصيني",
      image: "assets/images/recipe5.jpg",
      theList: chineseKitchenList),
  KitchenAssets(
      id: 1,
      name: "المطبخ الصيني",
      image: "assets/images/recipe5.jpg",
      theList: chineseKitchenList),
  KitchenAssets(
      id: 1,
      name: "المطبخ الصيني",
      image: "assets/images/recipe5.jpg",
      theList: chineseKitchenList),
];

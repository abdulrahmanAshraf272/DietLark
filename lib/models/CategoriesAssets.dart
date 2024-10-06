import 'package:flutter/material.dart';
import 'package:food_app/models/FoodData.dart';
import 'package:food_app/models/food_categories_lists.dart';

class CategoriesAssets {
  int id;
  final String title, image;
  final List sectionList;

  CategoriesAssets(
      {required this.id,
      required this.title,
      required this.image,
      required this.sectionList});
}

//قائمة اصناف الاطعمة
List<CategoriesAssets> categoriesAssetsList = [
  CategoriesAssets(
      id: 1,
      title: "اللحوم",
      image: "assets/images/categories/meat2.png",
      sectionList: meatsList),
  CategoriesAssets(
      id: 2,
      title: "بيض و دواجن",
      image: "assets/images/categories/chicken.png",
      sectionList: birdsList),
  CategoriesAssets(
      id: 3,
      title: "الأكلات البحرية",
      image: "assets/images/categories/seafood.png",
      sectionList: seafoodList),
  CategoriesAssets(
      id: 4,
      title: "المكسرات",
      image: "assets/images/categories/nuts2.png",
      sectionList: nutsList),
  CategoriesAssets(
      id: 5,
      title: "الحبوب",
      image: "assets/images/categories/rice.png",
      sectionList: beensList),
  CategoriesAssets(
      id: 6,
      title: "البقوليات",
      image: "assets/images/categories/legumes.png",
      sectionList: legumesList),
  CategoriesAssets(
      id: 7,
      title: "مشتقات الألبان",
      image: "assets/images/categories/dairy.png",
      sectionList: dairyList),
  CategoriesAssets(
      id: 8,
      title: "المخبوزات",
      image: "assets/images/categories/pastries.png",
      sectionList: bakeryList),
  CategoriesAssets(
      id: 9,
      title: "الحلويات",
      image: "assets/images/categories/desserts_icon.png",
      sectionList: dessertsList),
  CategoriesAssets(
      id: 10,
      title: "الفواكه",
      image: "assets/images/categories/fruit.png",
      sectionList: fruitsList),
  CategoriesAssets(
      id: 11,
      title: "الخضروات",
      image: "assets/images/categories/pepper.png",
      sectionList: vegetablesList),
  CategoriesAssets(
      id: 12,
      title: "الزيوت",
      image: "assets/images/categories/oils.png",
      sectionList: oilsList),
];

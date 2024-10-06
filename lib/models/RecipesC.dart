import 'package:flutter/material.dart';

class RecipesC {
  int id;
  String image, title;

  RecipesC({required this.id, required this.image, required this.title});
}

List<RecipesC> recipesList = [
  RecipesC(
      id: 1, image: "assets/images/recipe1.jpg", title: "عجينة الكريب المالح"),
  RecipesC(id: 2, image: "assets/images/recipe2.jpg", title: "البفتيك"),
  RecipesC(
      id: 3,
      image: "assets/images/recipe3.jpg",
      title: "بفتيك بالفرن مع الخضار"),
  RecipesC(id: 4, image: "assets/images/recipe4.jpg", title: "كوكيز محشية"),
  RecipesC(id: 5, image: "assets/images/recipe5.jpg", title: "برجر صحي")
];

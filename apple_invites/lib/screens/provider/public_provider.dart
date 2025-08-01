import 'package:apple_invites/screens/models/category_model.dart';
import 'package:flutter/material.dart';

class PublicProvider extends ChangeNotifier {
  final List<CategoryModel> listOfCategory = [
    CategoryModel(name: "Music"),
    CategoryModel(name: "Sport"),
    CategoryModel(name: "Dancing"),
    CategoryModel(name: "Study"),
    CategoryModel(name: "Art"),
    CategoryModel(name: "Theatre"),
    CategoryModel(name: "Technology"),
    CategoryModel(name: "Gaming"),
    CategoryModel(name: "Business"),
    CategoryModel(name: "Health & Fitness"),
    CategoryModel(name: "Education"),
    CategoryModel(name: "Travel"),
    CategoryModel(name: "Cooking"),
    CategoryModel(name: "Photography"),
    CategoryModel(name: "Networking"),
    CategoryModel(name: "Charity"),
    CategoryModel(name: "Spirituality"),
    CategoryModel(name: "Comedy"),
    CategoryModel(name: "Literature"),
  ];

  String? selectedCategory;

  void setSelectedCategory(String category) {
    selectedCategory = category;
    notifyListeners();
  }
}

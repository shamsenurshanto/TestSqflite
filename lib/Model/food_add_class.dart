import 'dart:ffi';

import 'package:get/get.dart';

class Food {
  String name;
  String price;
  String category;
  List<String> size;
  List<String> flavour;
  List<String> spice;

  Food({required this.name, required this.price, required this.category, required this.size, required this.flavour, required this.spice});
}

class FoodAttributes {
  List<String> size;
  List<String> flavour;
  List<String> spice;

  FoodAttributes({required this.size, required this.flavour, required this.spice});
}

class FoodList {
  List<Food> FoodLists;
  FoodList({required this.FoodLists});
}

class AttributeListModel {
  List<String> attributeList = [];
  var isSelected = <bool>[].obs();
}

import 'package:get/get.dart';

class CategoryModel {
  final String name;

  CategoryModel({required this.name});

  // Method to convert AddToCartModel object to a map
  Map<String, Object?> toMap() {
    return {
      'name': name,
    };
  }

  @override
  String toString() {
    return 'CategoryModel{ name: $name}';
  }
}

class FoodCreateModel {
  final String name;

  FoodCreateModel({required this.name});

  // Method to convert AddToCartModel object to a map
  Map<String, Object?> toMap() {
    return {
      'name': name,
    };
  }

  @override
  String toString() {
    return 'FoodCreateModel{ name: $name}';
  }
}

class AllProductModel {
  final String name;
  final String attrName; //attribute name like small , Large etc
  final int catId; //category id
  final int foodId;
  final double price;

  AllProductModel({required this.name, required this.attrName, required this.catId, required this.foodId, required this.price});

  // Method to convert AddToCartModel object to a map
  Map<String, Object?> toMap() {
    return {
      'name': name,
      'attrName': attrName,
      'catId': catId,
      'foodId': foodId,
      'price': price,
    };
  }

  @override
  String toString() {
    return 'AllProductModel{ name: $name}';
  }
}

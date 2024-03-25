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

  AllProductModel({required this.name});

  // Method to convert AddToCartModel object to a map
  Map<String, Object?> toMap() {
    return {
      'name': name,
    };
  }

  @override
  String toString() {
    return 'AllProductModel{ name: $name}';
  }
}

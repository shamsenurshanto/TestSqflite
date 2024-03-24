import 'package:get/get.dart';

class CategoryModel {
  // final int id;
  final String name;
  // final int index;

  // Constructor
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

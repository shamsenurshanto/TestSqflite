import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ItemVarriationPriceModel {
  int id;
  List<TextEditingController> texteditingController;

  // Constructor
  ItemVarriationPriceModel({required this.id, required this.texteditingController});
  // Method to convert AddToCartModel object to a map
  Map<String, Object?> toMap() {
    return {
      'id': id,
    };
  }

  @override
  String toString() {
    return 'ItemVarriationPriceModel{id: $id}';
  }
}

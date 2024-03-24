import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ItemVarriationPriceModel {
  int id;
  String name;//cat name
  List<TextEditingController> texteditingController;//for names
  List<TextEditingController> texteditingControllerForPrice;//for price


  // Constructor
  ItemVarriationPriceModel({required this.id, required this.texteditingController,required this.name,required this.texteditingControllerForPrice});
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

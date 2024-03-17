import 'package:get/get.dart';

class AddToCartModel {
  final int id;
  final String name;
  final int index;
  late final int amount;
  final int price;

  // Constructor
  AddToCartModel({required this.id, required this.name, required this.index, required this.amount, required this.price});

  // Method to convert AddToCartModel object to a map
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'index': index,
      'amount': amount,
      'price': price,
    };
  }

  @override
  String toString() {
    return 'AddToCartModel{id: $id, name: $name, index: $index, amount: $amount, price: $price}';
  }
}


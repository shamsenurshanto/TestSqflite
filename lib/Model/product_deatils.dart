class ProductDetails {
  final String name;
  final int price;
  final String img;
  final String category;

  ProductDetails({required this.name, required this.price, required this.img, required this.category});

  Map<String, Object?> toMap() {
    return {'name': name, 'price': price, 'img': img, 'category': category};
  }

  @override
  String toString() {
    return 'ProductName{id: name: $name, price: $price}';
  }
}

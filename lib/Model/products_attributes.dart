

import 'package:get/get.dart';

class ProductsAttributes {
  List<String> size;
  List<String> flavour;
  List<String> spice;

  ProductsAttributes({required this.size, required this.flavour, required this.spice});
}




class AttributeListModel {
  List<String> attributeList = [];
  var isSelected = <bool>[].obs();
}


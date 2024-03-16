import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:testhive/Controller/attribute_controller.dart';
import 'package:testhive/Model/products_attributes.dart';
import 'package:testhive/Model/attribute_model.dart';
import '../Model/product_deatils.dart';
import 'category_controller.dart';

class ProductAddController extends GetxController {
  var foodList = <dynamic>[].obs;

  //size flavour spice
  var attributeList = <String>[].obs;
  var attributeListFlavour = <String>[].obs;
  var attributeListSpice = <String>[].obs;

  RxBool attributesButtonsSize = RxBool(false);
  RxBool attributesButtonsFalvour = RxBool(false);
  RxBool attributesButtonsSpice = RxBool(false);

  final AttributeController controllerattr = Get.put(AttributeController());
  final CategoryController controllerFood = Get.put(CategoryController());

  RxInt indi = RxInt(0);
  RxInt indexOfClickedButton = RxInt(0);

  RxString statusShow = RxString("1");
  var arrayof = <int>[].obs;

  ProductsAttributes attributeDetails = ProductsAttributes(
    size: [],
    flavour: [],
    spice: [],
  );

  RxList<Map<String, List<String>>> productAttributelistBySelected =
      <Map<String, List<String>>>[].obs;
  RxList<List<String>> Lstring = <List<String>>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getAttributeValue();
  }

  getAttributeValue() {
    Lstring.clear();
    controllerattr.attributeListModel.value!.attributeList.forEach((element) {
      Lstring.add([]);
    });
  }

  void removeAtrribute(int index) {
    attributeList.removeAt(index);
  }

  void removeAtrributeFlavour(int index) {
    attributeListFlavour.removeAt(index);
  }

  void removeAtrributeSpice(int index) {
    attributeListSpice.removeAt(index);
  }

  void clickedSizeButton() {
    attributeList.clear();

    attributesButtonsSize.value = !attributesButtonsSize.value;
  }

  void clickedFlavourButton() {
    attributeListFlavour.clear();

    attributesButtonsFalvour.value = !attributesButtonsFalvour.value;
  }

  void clickedSpiceButton() {
    attributeListSpice.clear();
    attributesButtonsSpice.value = !attributesButtonsSpice.value;
  }

  //size
  void addAttributeSize(int index, String attributeName) {
    attributeList.clear();
    attributeList.add(attributeName);
    Lstring[index].addAll([...attributeList]);
    Lstring.refresh();
    Lstring[index].forEach((element) {
      print(element);
    });
    // productAttributelistBySelected.clear();
    attributeDetails.size = attributeList;
  }

  Future<void> addProductToDB(String foodname, String priceForm) async {
    priceForm ??= '0';
    ProductDetails foodName = ProductDetails(
        name: foodname, price: int.parse(priceForm), img: 'img', category: 'Breakfast');
    controllerFood.insertFoodName(foodName);
    int id = 0;
    try {
      id = await CategoryController().getLastJoinedFoodId();
    } catch (e) {
      print(e);
    }
    for (int i = 0; i < Lstring.length; i++) {
      AttributeList attributeList =
          new AttributeList(id: id, name: controllerattr.attributeListModel.value!.attributeList[i], age: 12, attributeList: Lstring[i].toList());
      controllerFood.insertAttributeList(attributeList);
    }
    controllerFood.printJoinedData();
    // controllerFood.deleteFoodAndAttributelistTable();
  }
}

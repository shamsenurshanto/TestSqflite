import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:testhive/Controller/product_create_controller.dart';
import 'package:testhive/Model/food_add_class.dart';

import 'package:testhive/Model/themealdb_model.dart';

class attributeController extends GetxController {
  var foodList = <dynamic>[].obs;
  RxInt indi = RxInt(0);
  RxInt indexOfClickedButton = RxInt(0);

  RxString statusShow = RxString("1");
  RxBool indiSizeAttribute = RxBool(false);

  RxBool indiFlavAttribute = RxBool(false);

  RxBool indiSpiceAttribute = RxBool(false);

  var arrayof = <int>[].obs;
  RxMap<String, List<dynamic>> cartMap = {
    'none': [
      {'name': 'Product1', 'price': 20, 'img': 'image1.jpg'},
      {'name': 'Product2', 'price': 30, 'img': 'image2.jpg'},
    ],
  }.obs;
  var attributeList = <String>['Size', 'Flavour', 'Colors'].obs;
// final user = Rxn<UserModel>();

  //  AttributeListModel attributeListModel = new AttributeListModel(

  // );
  final attributeListModel = Rxn<AttributeListModel>();

  @override
  void onInit() {
    // TODO: implement onInit

    setAllValue();
    print("ooninit ");
  }

  setAllValue() {
    attributeListModel.value = AttributeListModel();
    print("set value called ");
    attributeListModel.value?.attributeList.addAll(attributeList);
    for (int i = 0; i < attributeListModel.value!.attributeList.length; i++) {
      attributeListModel.value?.isSelected.add(false);
    }
    attributeListModel.refresh();
  }

  addAttributetoList(String attribute) {
    attributeListModel.value!.attributeList.add(attribute);
    attributeListModel.value!.isSelected.add(false);
    final productAddController product = Get.put(productAddController());

    attributeListModel.refresh();
    // controllerProductAdd.Lstring.clear();
    for (bool word in attributeListModel.value!.isSelected) {
      print(word);
      // controllerProductAdd.Lstring.addAll([]);
    }
  }

  getSelectedAttribute(int index) {
    attributeListModel.value?.isSelected[index] = !attributeListModel.value!.isSelected[index];
    //  print(attributeListModel.isSelected[index]);
    attributeListModel.refresh();
  }
}

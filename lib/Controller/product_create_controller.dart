import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:testhive/Controller/attributeController.dart';
import 'package:testhive/Controller/foodLocalDbController/food_category_db_controller.dart';
import 'package:testhive/Model/employee_model.dart';
import 'package:testhive/Model/food_card_model.dart';
import 'package:testhive/Model/task_entity.dart';
import 'package:testhive/Model/themealdb_model.dart';
import 'package:testhive/View/Dashboard/Employee_controller.dart';

import '../Model/food_add_class.dart';

class CartObject {
  String name;
  int price;
  String img;

  CartObject({this.name = '', this.price = 0, this.img = ''});
}

class productAddController extends GetxController {
  var foodList = <dynamic>[].obs;

  //size flavour spice
  var attributeList = <String>[].obs;
  var attributeListFlavour = <String>[].obs;
  var attributeListSpice = <String>[].obs;

  RxBool attributesButtonsSize = RxBool(false);
  RxBool attributesButtonsFalvour = RxBool(false);
  RxBool attributesButtonsSpice = RxBool(false);

  final attributeController controllerattr = Get.put(attributeController());
  final foodCategoryTable controllerFood = Get.put(foodCategoryTable());

  RxInt indi = RxInt(0);
  RxInt indexOfClickedButton = RxInt(0);
  var employeeListPresent = <EmployeeModel>[].obs;
  var updatedList = <EmployeeModel>[];
  var updatedListDate = <Task>[];
  RxString statusShow = RxString("1");
  var arrayof = <int>[].obs;
  var Foodlist = <Food>[].obs();

  RxMap<String, List<dynamic>> cartMap = {
    'none': [
      {'name': 'Product1', 'price': 20, 'img': 'image1.jpg'},
      {'name': 'Product2', 'price': 30, 'img': 'image2.jpg'},
    ],
  }.obs;

  var foodAddList = <Food>[].obs();
  FoodAttributes attributeDetails = FoodAttributes(
    size: [],
    flavour: [],
    spice: [],
  );

  RxList<Map<String, List<String>>> productAttributelistBySelected = <Map<String, List<String>>>[].obs;
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
    if (priceForm == null) priceForm = '0';
    FoodName foodName = new FoodName(name: foodname, price: int.parse(priceForm), img: 'img', category: 'Breakfast');
    controllerFood.insertFoodName(foodName);
    int id = 0;
    try {
      id = await foodCategoryTable().getLastJoinedFoodId();
    } catch (e) {
      print(e);
    }
    for (int i = 0; i < Lstring.length; i++) {
      AttributeList attributeList = new AttributeList(id: id, name: 'name', age: 12, attributeList: Lstring[i].toList());
      controllerFood.insertAttributeList(attributeList);
    }
    controllerFood.printJoinedData();
    // controllerFood.deleteFoodAndAttributelistTable();
  }
}

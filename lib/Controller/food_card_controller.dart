import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import '../Model/food_category_db.dart';

class CartObject {
  String name;
  int price;
  String img;

  CartObject({this.name = '', this.price = 0, this.img = ''});
}

class foodCardController extends GetxController {
  var foodList = <dynamic>[].obs;
  final foodCategoryTable controllerFoodCategory = Get.put(foodCategoryTable());

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

  @override
  void onInit() {
    // TODO: implement onInit
  }

  getAddedMap(CartObject cartObject, int index, String str) {
    cartMap[str]?[index]({'name': cartObject.name, "price": cartObject.price, "img": cartObject.img});
    print(cartMap[str]?[index].name);
  }

  List<dynamic> getFoodListByCategory(String CategoryName) {
    getData(CategoryName);

    return foodList;
  }

  getIncrease(int index, int val) {
    indi.value++;
    arrayof[index] = val + 1;
  }

  getDecrease(int index, int val) {
    if (val > 0) arrayof[index] = val - 1;
  }

  getChangeSizeAttribute() {
    indiSizeAttribute.value = !indiSizeAttribute.value;
  }

  getChangeFlavAttribute() {
    indiFlavAttribute.value = !indiFlavAttribute.value;
  }

  getChangeSpiceAttribute() {
    indiSpiceAttribute.value = !indiSpiceAttribute.value;
  }

  Future<List<Map<String, dynamic>>> joinAndFilterById(int foodNameId) async {
    print(foodNameId);
    final db = await openDatabase('my_database.db');
    List<Map<String, dynamic>> result = await db.rawQuery('''
      SELECT foodName.id, foodName.name as foodName_name,attributeList.name as attributeList_name,attributeList.attributeList as attributeList
      FROM foodName INNER JOIN attributeList ON foodName.id = attributeList.id WHERE foodName.id = ?ORDER BY foodName.id DESC  ''',
        [foodNameId]);
    result.forEach((element) {
      print(element['attributeList']);
      List<String> sizesList = element['attributeList'].split(',');
      ListForDisplayingInModal.value.addAll(sizesList);
      // sizesList.forEach((element) {
      //   print(element);
      // });
    });

    return result;
  }

  List<Map<String, dynamic>> foodListDashBoard = <Map<String, dynamic>>[].obs;
  List<String> splitList = [];
  List<List<String>> listString = [];
  var ListForDisplayingInModal = <String>[].obs;

  getAttributeListWithId(String attributeListString, int index) {
    ListForDisplayingInModal.clear();
  }

  Future<void> getData(String search) async {
    statusShow.value = '0';
    arrayof.clear();
    print(search);
    foodListDashBoard = await controllerFoodCategory.joinTable();
    for (final row in foodListDashBoard) {
      print('Joined Data:');
      print('food Details:');
      print('foodName_name: ${row['foodName_name']}');
      print('price: ${row['price']}');
      print('category: ${row['category']}');

      print('attribute Details:');
      print('Name: ${row['attributeList_id']}');
      print('Name: ${row['attributeList_name']}');
      print('Age: ${row['attributeList_age']}');
      print('AttributeList: ${row['attributeList']}');
      print('---');
    }

    Timer(Duration(seconds: 2), () {
      statusShow.value = '1';
    });
  }
}

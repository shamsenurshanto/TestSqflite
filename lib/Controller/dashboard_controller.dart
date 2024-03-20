import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:sqflite/sqflite.dart';
import 'package:testhive/Controller/add_to_cart_controller.dart';

import 'category_controller.dart';

class DashboardController extends GetxController {
  var foodList = <dynamic>[].obs;
  final CategoryController controllerFoodCategory = Get.put(CategoryController());
  final AddToCartController addToCartController =Get.put(AddToCartController());
  TextEditingController textEditingControllerForModal = TextEditingController();


  RxInt indi = RxInt(0);
  RxInt indexOfClickedButton = RxInt(0);

  RxString statusShow = RxString("1");
  RxBool indiSizeAttribute = RxBool(false);

  RxBool indiFlavAttribute = RxBool(false);

  RxBool indiSpiceAttribute = RxBool(false);
  var arrayof = <int>[].obs;
  var productDetailsList = <Map<String, List<String>>>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
  }

  List<dynamic> getFoodListByCategory(String CategoryName) {
    getData(CategoryName);

    return foodList;
  }

  setTexteditingControllerValue(String val,int index){
    textEditingControllerForModal.text = val;
    arrayof[index] = int.parse(val);
    print(textEditingControllerForModal.text);
    // addToCartController.addToCartList[index].amount = arrayof[index];
  }

  getIncrease(int index, int val) {
    indi.value++;
    arrayof[index] = val + 1;
    setTexteditingControllerValue(arrayof[index].toString(),index);
  }

  getDecrease(int index, int val) {
    if (val > 0) arrayof[index] = val - 1;
    setTexteditingControllerValue(arrayof[index].toString(),index);

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
    productDetailsList.clear();
    result.forEach((element) {
      // print(element['attributeList']);
      List<String> sizesList = element['attributeList'].split(',');
      Map<String, List<String>> newData = {element['attributeList_name']: sizesList};

      productDetailsList.value.add(newData);
      productDetailsList.forEach((element) {
        // print(element);

        // for (var list in element.values) {
        //   for (var string in list) {
        //     // print(string);
        //   }
        // }

        // sizesList.addAll(element.values);
      });
      // print(productDetailsList.length);
      productDetailsList.refresh();
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

  Future< List<Map<String, dynamic>>> getData(String search) async {
    statusShow.value = '0';
    arrayof.clear();
    print(search);
    foodListDashBoard = await controllerFoodCategory.joinTable();
    print(foodListDashBoard.length);
    // for (final row in foodListDashBoard) {
    //   print('Joined Data:');
    //   print('food Details:');
    //   print('foodName_name: ${row['foodName_name']}');
    //   print('price: ${row['price']}');
    //   print('category: ${row['category']}');

    //   print('attribute Details:');
    //   print('Name: ${row['attributeList_id']}');
    //   print('Name: ${row['attributeList_name']}');
    //   print('Age: ${row['attributeList_age']}');
    //   print('AttributeList: ${row['attributeList']}');
    //   print('---');
    // }
    

    Timer(Duration(seconds: 2), () {
      statusShow.value = '1';
      
    });
    return foodListDashBoard;
  }
}

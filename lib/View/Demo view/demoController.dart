import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:sqflite/sqflite.dart';
import 'package:testhive/Controller/add_to_cart_controller.dart';

import '../../Controller/category_controller.dart';



class DemoController extends GetxController {
  var foodList = <dynamic>[].obs;
  final CategoryController controllerFoodCategory = Get.put(
      CategoryController());
  final AddToCartController addToCartController = Get.put(
      AddToCartController());
  TextEditingController textEditingControllerForModal = TextEditingController();


  RxInt indi = RxInt(0);
  RxInt indexOfClickedButton = RxInt(0);

  RxString statusShow = RxString("1");
  RxBool addCategoryFirst = RxBool(false);

  RxBool indiFlavAttribute = RxBool(false);

  RxBool indiSpiceAttribute = RxBool(false);
  var arrayof = <int>[].obs;
  var productDetailsList = <Map<String, List<String>>>[].obs;


  var categoryList =<String>['Tea'].obs;
  RxInt priceVariationNumber = RxInt(1);
  RxInt forLoopNo1 = RxInt(0);
  var categoryListWhichContainsAllVariations = <bool>[].obs;


  @override
  void onInit() {
    // TODO: implement onInit
  }
  setpriceVariationNumber(){
    priceVariationNumber.value++;
  }
  setAddCategoryFirst(){
    addCategoryFirst.value=!addCategoryFirst.value;
  }

}

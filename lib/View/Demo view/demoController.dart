import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:sqflite/sqflite.dart';
import 'package:testhive/Controller/add_to_cart_controller.dart';

import '../../Controller/category_controller.dart';
import '../../Model/category_model.dart';
import '../../Model/item_varriation_price_model.dart';

class DemoController extends GetxController {
  var foodList = <dynamic>[].obs;
  final CategoryController controllerFoodCategory = Get.put(CategoryController());
  final AddToCartController addToCartController = Get.put(AddToCartController());
  TextEditingController textEditingControllerForModal = TextEditingController();

  RxInt indi = RxInt(0);
  RxInt indexOfClickedButton = RxInt(0);

  RxString statusShow = RxString("1");
  RxBool addCategoryFirst = RxBool(false);

  RxBool indiFlavAttribute = RxBool(false);

  RxBool indiSpiceAttribute = RxBool(false);
  var arrayof = <int>[].obs;
  var productDetailsList = <Map<String, List<String>>>[].obs;

  var categoryList = <String>[].obs;
  RxInt priceVariationNumber = RxInt(0);
  RxInt forLoopNo1 = RxInt(0);
  var categoryListWhichContainsAllVariations = <bool>[].obs;
  TextEditingController addCategoryTextController = new TextEditingController(); // category add korun
  Map<int, List<TextEditingController>> textEditingControllerMap = {};
  var priceAndVarriationAddingTextController = <int, List<TextEditingController>>{}.obs;
  List<TextEditingController> priceAndVarriationAddingTextControllerList = [];
  var itemVarriationPriceModel = <ItemVarriationPriceModel>[].obs;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    // createTable();
    //
    // await insertCategoryModel(categoryModel);
    // printData();
  }

  createTable() async {
    try {
      final db = await openDatabase('my_database.db');
      await db.execute(
        'CREATE TABLE categoryModel(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)',
      );
    } catch (e) {
      print(e);
      print("jel");
    }
  }

  Future<void> insertCategoryModel(CategoryModel categoryModel) async {
    // Get a reference to the database.
    final db = await openDatabase('my_database.db');
    await db.insert(
      'categoryModel',
      categoryModel.toMap(),
      // conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getAllFromCategoryModel() async {
    //SELECT * FROM categoryModel;
    final db = await openDatabase('my_database.db');
    return await db.rawQuery('''SELECT categoryModel.name as categoryModel_name,categoryModel.id as categoryModel_id FROM categoryModel''');
  }

  printData() async {
    try {
      final joinedData = await getAllFromCategoryModel();
      for (final row in joinedData) {
        print('Print Data:');
        print('categoryModel Details:');
        print('categoryModel_name: ${row['categoryModel_name']}');
        print('categoryModel_id: ${row['categoryModel_id']}');
        print('---------');
      }
    } catch (e) {}
  }

  setpriceVariationNumber(List<TextEditingController> texteditingController) {
    priceVariationNumber.value++;
    texteditingController.add(TextEditingController());
    itemVarriationPriceModel.refresh();
  }

  setPriceAndVarriationAddingTextControllerFirsTime() {
    if (itemVarriationPriceModel.length == 0) {
      priceAndVarriationAddingTextControllerList.clear();
      List<TextEditingController> demoList = [];
      priceAndVarriationAddingTextControllerList.add(TextEditingController());
      demoList.addAll(priceAndVarriationAddingTextControllerList);

      ItemVarriationPriceModel itemVarriationPriceModel2 =
          new ItemVarriationPriceModel(id: priceVariationNumber.value, texteditingController: demoList);
      itemVarriationPriceModel.add(itemVarriationPriceModel2);
      itemVarriationPriceModel.refresh();
      print("here");
    }
  }

  setPriceAndVarriationAddingTextController() {
    List<TextEditingController> demoList = [];
    priceAndVarriationAddingTextControllerList.add(TextEditingController());
    demoList.addAll(priceAndVarriationAddingTextControllerList);
    ItemVarriationPriceModel itemVarriationPriceModel2 =
        new ItemVarriationPriceModel(id: priceVariationNumber.value, texteditingController: demoList);
    itemVarriationPriceModel.add(itemVarriationPriceModel2);
    itemVarriationPriceModel.refresh();
    print("here many time session ");
  }

  setAddCategoryFirst() {
    addCategoryFirst.value = !addCategoryFirst.value;
  }

  setNewCategoryList() {
    // categoryList.addAll([...,txt]);
    List<TextEditingController> demoList = [];
    List<TextEditingController> demoList2 = [];
    // priceAndVarriationAddingTextControllerList.clear();
    // priceAndVarriationAddingTextControllerList.add();
    demoList2.add(TextEditingController());
    demoList.addAll(demoList2);
    ItemVarriationPriceModel itemVarriationPriceModel2 =
        new ItemVarriationPriceModel(id: priceVariationNumber.value, texteditingController: demoList);
    itemVarriationPriceModel.add(itemVarriationPriceModel2);
    itemVarriationPriceModel.refresh();
  }
}

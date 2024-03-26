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
  List<TextEditingController> individualItemsPriceTextControllerList = [];
  var itemVarriationPriceModel = <ItemVarriationPriceModel>[].obs;

  var individualCategoryMainItemName = <TextEditingController>[].obs;
  var individualCategoryMainItemNameBoolList = <bool>[].obs;
  var itemUnderCategoryModelList = <ItemUnderCategoryModel>[].obs;

  var rxList = <List<ItemUnderCategoryModel>>[].obs;

  /// if the item should show or not

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    //
    // await insertCategoryModel(categoryModel);
    // printData();
  }

  createTable() async {
    try {
      final db = await openDatabase('my_database.db');
      await db.execute(
        'CREATE TABLE IF NOT EXISTS allProductModel(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,attrName Text,price DOUBLE,foodId INTEGER,catId INTEGER)',
      );
      await db.execute(
        'CREATE TABLE IF NOT EXISTS categoryModel(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)',
      );
      await db.execute(
        'CREATE TABLE IF NOT EXISTS foodCreateModel(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)',
      );
    } catch (e) {
      print(e);
      print("jel");
    }
  }



  Future<int> getLastAddedToFoodCreateModelId() async {
    final db = await openDatabase('my_database.db');
    List<Map<String, dynamic>> result = await db.rawQuery('''
    SELECT foodCreateModel.id as foodName_id FROM foodCreateModel ORDER BY id  DESC LIMIT 1''');
    return result[0]['foodName_id'];
  }

  Future<void> insertCategoryModel(CategoryModel categoryModel) async {
    // Get a reference to the database.
    final db = await openDatabase('my_database.db');
    try {
      await db.insert(
        'categoryModel',
        categoryModel.toMap(),
        // conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print(e);
      print('insertCategoryModel');
    }
  }

  Future<int> insertFoodCreateModel(FoodCreateModel foodCreateModel) async {
    // Get a reference to the database.
    final db = await openDatabase('my_database.db');
    try {
      await db.insert(
        'foodCreateModel',
        foodCreateModel.toMap(),
        // conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print(e);
    }
    int id = await getLastAddedToFoodCreateModelId();
    return id;
  }

  Future<void> insertAllProductModel(AllProductModel allProductModel) async {
    // Get a reference to the database.
    final db = await openDatabase('my_database.db');
    try {
      await db.insert(
        'allProductModel',
        allProductModel.toMap(),
        // conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print(e);
    }
  }

  Future<List<Map<String, dynamic>>> getAllFromCategoryModel() async {
    //SELECT * FROM categoryModel;
    final db = await openDatabase('my_database.db');
    return await db.rawQuery('''SELECT categoryModel.name as categoryModel_name,categoryModel.id as categoryModel_id FROM categoryModel''');
  }

  Future<List<Map<String, dynamic>>> getAllFromAllProductModel() async {
    //SELECT * FROM categoryModel;
    final db = await openDatabase('my_database.db');
    return await db.rawQuery(
        '''SELECT allProductModel.id AS allProductModel_id, allProductModel.name AS allProductModel_name,allProductModel.attrName AS allProductModel_attrName,
    allProductModel.price AS allProductModel_price,allProductModel.foodId AS allProductModel_foodId,allProductModel.catId AS allProductModel_catId FROM 
    allProductModel''');
  }

  Future<List<Map<String, dynamic>>> getProductByCategoryId(int categoryId) async {
    final db = await openDatabase('my_database.db');
    return await db.rawQuery('''SELECT allProductModel.id AS allProductModel_id, 
                allProductModel.name AS allProductModel_name,
                allProductModel.attrName AS allProductModel_attrName,
                allProductModel.price AS allProductModel_price,
                allProductModel.foodId AS allProductModel_foodId,
                allProductModel.catId AS allProductModel_catId 
         FROM allProductModel
         WHERE allProductModel.catId = ?''', [categoryId]);
  }

  deleteFoodAndAttributelistTable() async {
    final db = await openDatabase('my_database.db');
    // await db.rawQuery('DROP TABLE IF EXISTS foodName;');
    await db.rawQuery('DROP TABLE IF EXISTS foodCreateModel;');
    await db.rawQuery('DROP TABLE IF EXISTS categoryModel;');
    await db.rawQuery('DROP TABLE IF EXISTS allProductModel;');
  }

  printData() async {
    try {
      // final joinedData = await getAllFromCategoryModel();
      // for (final row in joinedData) {
      //   print('Print Data:');
      //   print('categoryModel Details:');
      //   print('categoryModel_name: ${row['categoryModel_name']}');
      //   print('categoryModel_id: ${row['categoryModel_id']}');
      //   print('---------');
      // }

      final joinedData = await getAllFromAllProductModel();
      for (final row in joinedData) {
        print('Print Data:');
        print('allProductModel Details:');
        print('allProductModel_name: ${row['allProductModel_name']}');
        print('allProductModel_id: ${row['allProductModel_id']}');
        print('allProductModel_attrName: ${row['allProductModel_attrName']}');
        print('allProductModel_price: ${row['allProductModel_price']}');
        print('allProductModel_foodId: ${row['allProductModel_foodId']}');
        print('allProductModel_catId: ${row['allProductModel_catId']}');
        print('---------');
      }
    } catch (e) {
      print(e);
      print("data print prbl");
    }
  }

  fetchDataUsingCategoryId(int catId) async {
    try {
      final joinedData = await getProductByCategoryId(catId);
      // itemUnderCategoryModelList.clear();
      var demoItemUnderCategoryModelList = <ItemUnderCategoryModel>[];
      for (final row in joinedData) {
        ItemUnderCategoryModel itemUnderCategoryModel = new ItemUnderCategoryModel(
            MainName: row['allProductModel_name'], attrName: row['allProductModel_attrName'], attrPrice: row['allProductModel_price']);

        // demoItemUnderCategoryModelList.addAll(itemUnderCategoryModelList);
        demoItemUnderCategoryModelList.add(itemUnderCategoryModel);
        itemUnderCategoryModelList.clear();
        // itemUnderCategoryModelList.addAll(demoItemUnderCategoryModelList); //itemUnderCategoryModelList add korbo


        // rxList[rxList.length-1].addAll(demoItemUnderCategoryModelList);

        print('Print Data catId : ' + rxList.length.toString());
        print('allProductModel Details:');
        print('allProductModel_name: ${row['allProductModel_name']}'); //mainName
        print('allProductModel_id: ${row['allProductModel_id']}');
        print('allProductModel_attrName: ${row['allProductModel_attrName']}');
        print('allProductModel_price: ${row['allProductModel_price']}');
        print('allProductModel_foodId: ${row['allProductModel_foodId']}');
        print('allProductModel_catId: ${row['allProductModel_catId']}');
        print('--------------------------------------');
      }
      rxList.add(demoItemUnderCategoryModelList);
      itemUnderCategoryModelList.refresh();
      rxList.refresh();
      for(int i=0;i<rxList.length;i++){
        print("all the print ");
        for(int j=0;j<rxList[i].length;j++){
          print(rxList[i][j].attrPrice.toString()+"  "+rxList[i][j].attrName);
        }
      }
    } catch (e) {
      print(e);
      print("data print prbl fetch ");
    }
  }

  setpriceVariationNumber(List<TextEditingController> texteditingController, List<TextEditingController> texteditingControllerPrice) {
    priceVariationNumber.value++;
    texteditingController.add(TextEditingController());
    texteditingControllerPrice.add(TextEditingController());
    itemVarriationPriceModel.refresh();
  }

  printAllTextEditingOfOneCategory(int index) async {
    /// etar name chnage hobe
    //here index is the category id ;

    FoodCreateModel foodCreateModel = new FoodCreateModel(name: individualCategoryMainItemName[index].text);
    await insertFoodCreateModel(foodCreateModel);
    int id = await getLastAddedToFoodCreateModelId();
    print(individualCategoryMainItemName[index].text); //name of allProductModel M.tea
    for (int i = 0; i < itemVarriationPriceModel[index].texteditingController.length; i++) {
      //here it prints large(attrName) 30(price) , medium 16
        try{
          print(itemVarriationPriceModel[index].texteditingController[i].text +
              "   " +
              itemVarriationPriceModel[index].texteditingControllerForPrice[i].text.toString() +" -hello"+" "+index.toString()); //
          // AllProductModel allProductModel = new AllProductModel(
          //     name: individualCategoryMainItemName[index].text,
          //     attrName: itemVarriationPriceModel[index].texteditingController[i].text,
          //     catId: index,
          //     foodId: id,
          //     price: 23);
          // await insertAllProductModel(allProductModel);
        }
        catch(e){
          print(e);
        }


    }
    print("--------");
    print("-----------");
    print("--------");
    print("-----------");

    // await printData();
  }

  // setPriceAndVarriationAddingTextControllerFirsTime(int index) {
  //   if (itemVarriationPriceModel.length == 0) {
  //     priceAndVarriationAddingTextControllerList.clear();
  //     individualItemsPriceTextControllerList.clear();
  //     List<TextEditingController> demoList = [];
  //     List<TextEditingController> demoListForPrice = [];
  //     priceAndVarriationAddingTextControllerList.add(TextEditingController());
  //     individualItemsPriceTextControllerList.add(TextEditingController());
  //     demoListForPrice.addAll(individualItemsPriceTextControllerList);
  //     demoList.addAll(priceAndVarriationAddingTextControllerList);
  //     // individualCategoryMainItemName.clear();
  //     individualCategoryMainItemName.add(TextEditingController());
  //
  //     ItemVarriationPriceModel itemVarriationPriceModel2 =
  //         new ItemVarriationPriceModel(id: priceVariationNumber.value, texteditingController: demoList, texteditingControllerForPrice: demoListForPrice,  name: individualCategoryMainItemName[index].text);
  //     itemVarriationPriceModel.add(itemVarriationPriceModel2);
  //     itemVarriationPriceModel.refresh();
  //     print("here");
  //   }
  // }

  // setPriceAndVarriationAddingTextController(int index) {
  //   List<TextEditingController> demoList = [];
  //   List<TextEditingController> demoListPrice = [];
  //   priceAndVarriationAddingTextControllerList.add(TextEditingController());
  //   individualItemsPriceTextControllerList.add(TextEditingController());
  //   demoList.addAll(priceAndVarriationAddingTextControllerList);
  //   demoListPrice.addAll(individualItemsPriceTextControllerList);
  //   ItemVarriationPriceModel itemVarriationPriceModel2 =
  //       new ItemVarriationPriceModel(id: priceVariationNumber.value, texteditingController: demoList,texteditingControllerForPrice: demoListPrice, name:individualCategoryMainItemName[index].text);
  //   itemVarriationPriceModel.add(itemVarriationPriceModel2);
  //   itemVarriationPriceModel.refresh();
  //   print("here many time session ");
  // }

  setAddCategoryFirst() {
    addCategoryFirst.value = !addCategoryFirst.value;
  }

  setItemVarriationPriceModel() async {
    //here we will update  individualCategoryMainItemNameBoolList from database
    try {
      final joinedData = await getAllFromCategoryModel();
      itemVarriationPriceModel.clear();
      for (final row in joinedData) {
        print('Print Data:');
        print('categoryModel Details:');
        print('categoryModel_name: ${row['categoryModel_name']}');
        print('categoryModel_id: ${row['categoryModel_id']}');
        print('---------');
        await setNewCategoryList(row['categoryModel_name'], row['categoryModel_id']); // add every time
      }
      itemVarriationPriceModel.refresh();
    } catch (e) {
      print(e);
      print("setItemVarriationPriceModel");
    }
  }

  setNewCategoryList(String txt, int index) async {
    // categoryList.addAll([...,txt]);
    List<TextEditingController> demoList = [];
    List<TextEditingController> demoList2 = []; // for adding names (item nam)
    List<TextEditingController> demoListPrice = [];
    List<TextEditingController> demoListPrice2 = []; // for their prices (right side)
    // priceAndVarriationAddingTextControllerList.clear();
    // priceAndVarriationAddingTextControllerList.add();
    demoListPrice2.add(TextEditingController());
    demoListPrice.addAll(demoListPrice2);

    demoList2.add(TextEditingController());
    demoList.addAll(demoList2);
    ItemVarriationPriceModel itemVarriationPriceModel2 =
        new ItemVarriationPriceModel(id: index, texteditingController: demoList, texteditingControllerForPrice: demoListPrice, name: txt);
    itemVarriationPriceModel.add(itemVarriationPriceModel2);
    itemVarriationPriceModel.refresh();
    individualCategoryMainItemName.add(TextEditingController());
    individualCategoryMainItemNameBoolList.add(false);
     fetchDataUsingCategoryId(index);
  }

  setPriceVarriationTrueOrFalse(int index) {
    individualCategoryMainItemNameBoolList[index] = !individualCategoryMainItemNameBoolList[index];
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:testhive/Model/employee_model.dart';
import 'package:testhive/Model/food_card_model.dart';
import 'package:testhive/Model/task_entity.dart';
import 'package:testhive/Model/themealdb_model.dart';
import 'package:testhive/View/Dashboard/Employee_controller.dart';

class FoodName {
  final String name;
  final int price;
  final String img;
  final String category;

  // final List<>

  FoodName({required this.name, required this.price, required this.img, required this.category});

  Map<String, Object?> toMap() {
    return {'name': name, 'price': price, 'img': img, 'category': category};
  }

  //
  // factory FoodName.fromMap(Map<String, dynamic> map) {
  //   final List<String> colors = (map['color'] as String).split(',');
  //   return FoodName(
  //     name: map['name'] as String,
  //     age: map['age'] as int,
  //     color: colors,
  //   );
  // }

  @override
  String toString() {
    return 'FoodName{id: name: $name, price: $price}';
  }
}

class AttributeList {
  final int id;
  final String name;
  final int age;
  final List<String> attributeList;

  // final List<>

  AttributeList({required this.id, required this.name, required this.age, required this.attributeList});

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'attributeList': attributeList.join(','),
    };
  }

  @override
  String toString() {
    return 'AttributeList{id: $id, name: $name, age: $age}';
  }
}

class foodCategoryTable extends GetxController {
  var foodList = <dynamic>[].obs;

  // //size flavour spice
  // var attributeList = <String>[].obs;
  // var attributeListFlavour = <String>[].obs;
  // var attributeListSpice = <String>[].obs;
  //
  // RxBool attributesButtonsSize = RxBool(false);
  // RxBool attributesButtonsFalvour = RxBool(false);
  // RxBool attributesButtonsSpice = RxBool(false);

  RxInt indi = RxInt(0);

  @override
  void onInit() {
    // TODO: implement onInit
    createTable();
  }

  createTable() async {
    try {
      final db = await openDatabase('my_database.db');
      await db.execute(
        'CREATE TABLE foodName(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, price INTEGER, img TEXT, category TEXT)',
      );
      await db.execute(
        'CREATE TABLE attributeList(vid INTEGER PRIMARY KEY AUTOINCREMENT, id INTEGER , name TEXT, age INTEGER, attributeList TEXT)',
      );
    } catch (e) {
      print(e);
    }
  }

  Future<int> getLastJoinedFoodId() async {
    final db = await openDatabase('my_database.db');
    List<Map<String, dynamic>> result = await db.rawQuery('''
    SELECT 
      foodName.id as foodName_id
    FROM foodName ORDER BY id  DESC
    LIMIT 1
  ''');

    return result[0]['foodName_id'];
  }

  Future<void> insertFoodName(FoodName foodName) async {
    // Get a reference to the database.
    final db = await openDatabase('my_database.db');

    await db.insert(
      'foodName',
      foodName.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertAttributeList(AttributeList attributeList) async {
    // Get a reference to the database.
    final db = await openDatabase('my_database.db');
    await db.insert(
      'attributeList',
      attributeList.toMap(),
    );
  }

  Future<List<Map<String, dynamic>>> joinTable() async {
    final db = await openDatabase('my_database.db');
    return await db.rawQuery('''
      SELECT foodName.name as foodName_name, foodName.id as foodName_id,foodName.price as price, foodName.category as category,  attributeList.id as attributeList_id, attributeList.name as attributeList_name,attributeList.attributeList as attributeList
      FROM foodName
      INNER JOIN attributeList ON foodName.id = attributeList.id ORDER BY foodName.id DESC
    ''');
  }

  deleteFoodAndAttributelistTable() async {
    final db = await openDatabase('my_database.db');
    db.rawQuery('DROP TABLE IF EXISTS foodName;');
    db.rawQuery('DROP TABLE IF EXISTS attributeList;');
  }

  Future<void> printJoinedData() async {
    final joinedData = await joinTable();

    for (final row in joinedData) {
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
  }
}

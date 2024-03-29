import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:testhive/Model/attribute_model.dart';

import '../Model/product_deatils.dart';

class CategoryController extends GetxController {
  var foodList = <dynamic>[].obs;

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

  Future<void> insertFoodName(ProductDetails foodName) async {
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

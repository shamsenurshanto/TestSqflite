import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';
import 'package:testhive/Model/employee_model.dart';

class ProfileController extends GetxController {
  RxString phone = RxString('');
  RxString nameUpdate = RxString('');
  RxString idNumber = RxString('');
  RxString pin = RxString('');
  RxString updateIdNumber = RxString('');
  RxString name = RxString('');
  RxString imageLink = RxString('');
  RxString imageLinkNidFront = RxString('');
  RxString imageLinkNidBack = RxString('');
  RxString imageLinkidCard = RxString(''); //birthCertificate
  RxString birthCertificate = RxString(''); //birthCertificate
  RxString passport = RxString(''); //passport
  RxString realImageLinkNidFront = RxString('Upload Front side of the Card'); //realImageLinkNidFront
  RxString realImageLinkNidBack = RxString('Upload Back side of the Card'); //realImageLinkNidFront
  RxBool imageNidActive = RxBool(false);
  RxBool imageidActive = RxBool(false);
  RxBool imageLinkNidFrontStatus = RxBool(false); // check if the front  is called
  RxBool imageLinkNidBackStatus = RxBool(false); //

  /// check if the back is called
  RxBool visibilityIndicator = RxBool(false);
  late Box userBox;
  List<String> listTypes = ['NID', 'Passport', 'Birth Certificate'];
  final selected = Rxn<String>();
  var employeeList = <EmployeeModel>[];
  List<EmployeeModel> updatedList = [];
  // final GlobalController controllerGlobals = Get.put(GlobalController());
  void onInit() async {}

  Future<void> hiveInit() async {
    print("hello init");
    try {
      userBox = await Hive.openBox<EmployeeModel>('userBox');
    } catch (e) {
      print("init hello " + e.toString());
    }
  }

  void addEmployeeList() {
    // Add EmployeeModel instances manually
    // updatedList.add(EmployeeModel.fromData(
    //   name: 'John Doe',
    //   phone: '123-456-7890',
    //   pin: '1234',
    //   id: '1',
    // ));
    updateEmployeeList(updatedList);
  }

  // Method to update the EmployeeModel list
  Future<void> updateEmployeeList(List<EmployeeModel> updatedList) async {
    userBox = await Hive.openBox<EmployeeModel>('userBox');
    employeeList.assignAll(updatedList);
    print(updatedList);
    saveEmployeeListToHive();
  }

  // Method to save the EmployeeModel list to Hive
  Future<void> saveEmployeeListToHive() async {
    try {
      userBox?.put('employeeList', employeeList);
      print(" done e");
      loadEmployeeListFromHive();
    } catch (e) {
      print("error " + e.toString());
    }
  }

  // Method to retrieve the EmployeeModel list from Hive
  Future<void> loadEmployeeListFromHive() async {
    try {
      var savedList = userBox?.get('employeeList');
      print("print db ");
      print(savedList);
    } catch (e) {
      print("eerrrre " + e.toString());
    }
  }
}

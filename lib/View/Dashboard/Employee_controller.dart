import 'dart:ffi';

import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:testhive/Model/date_list.dart';
import 'package:testhive/Model/employee_model.dart';
import 'package:testhive/Model/employee_model_List.dart';
import 'package:testhive/Model/task_entity.dart';

class EmployeeController extends GetxController {
  var employeeList = <EmployeeModel>[].obs;
  var employeeListPresent = <EmployeeModel>[].obs;
  var updatedList = <EmployeeModel>[];
  var updatedListDate = <Task>[];
  RxString statusShow = RxString("0");
  @override
  void onInit() {
    // TODO: implement onInit

    storeData();
  }

  RxBool watchIcon = RxBool(true);
  RxString vx = RxString("");
  RxString picked_date = RxString("Picked date");
  var listAdded = [].obs;
  //  RxString listBool = <String>[].obs;
  List<RxString> listBool = [];
  List rxStringList = [].obs;
  List rxStringList_2 = [];

  late Box userBox;
  RxString textControllerName = RxString("0");
  RxString textControllertittle = RxString("");
  void updateName(String val) {
    textControllerName.value = val;
    print(textControllerName.value);
  }

  void updatetitle(String val) {
    textControllertittle.value = val;

    print(textControllertittle.value);
  }

  Future<void> addDateListDB(String statusShow_2) async {
    var box = await Hive.openBox('employeeBoxTask');
    var getResult = box.get(picked_date.value);
    print("getresult " + picked_date.value);
    print(getResult);

    if (getResult != null) {
      //  deleteList();
      // storeData();
      DateList dateList = getResult;
      List employee_list_attandance = [];
      print("indisde the ");

      rxStringList_2 = [];
      for (var item in dateList.employeeListStatus!) {
        // print(item);
        rxStringList_2.add(item);
      }
      //  employeeList.value=updatedList;
      rxStringList = rxStringList_2;
      print("indisde the rxStringList ");
      print(rxStringList);
      print("get result not nmull");
      if (statusShow_2 == "0") return;
    } else {
      deleteList();
      storeData();
      print("get result mull");
    }

    DateList dateList = DateList.fromData(employeeList: employeeList, employeeListStatus: rxStringList);

    box.put(picked_date.value, dateList);
    var boxval = box.get(picked_date.value);
    print("boxval pickked date " + picked_date.value);
    print(boxval);
  }

  Future<void> addEmployeeList() async {
    var box = Hive.box<employee_model_List>('employeeList');
    EmployeeModel emp1 = EmployeeModel.fromData(
      name: textControllerName.value,
      phone: textControllertittle.value,
      pin: '1234',
      id: '1',
    );

    List<employee_model_List> taskOutput = box.values.toList();
    //  updatedList.add(emp1);
    updatedList = [];
    updatedList.add(emp1);

    for (var item in taskOutput) {
      print(item.empList);

      employeeList.value = item.empList!;
      print("item ");
    }
    updatedList = employeeList.value + updatedList;
    // updatedList= updatedList.reversed;
    // updatedList.clear();

    employee_model_List emp = employee_model_List.fromData(empList: updatedList);
    // updatedList.clear();
    await box.put("employeeList", emp);
    storeData();
  }

  void storeData() async {
    try {
      // employeeListPresent.clear();
      var box = Hive.box<employee_model_List>('employeeList');
      List<employee_model_List> taskOutput = box.values.toList();
      for (var item in taskOutput) {
        print(item.empList);
        employeeList.value = item.empList!;
        print("item ");
        assignList();
      }
    } catch (e) {
      print("error store  " + e.toString());
    }
  }

  bool AddedOrNotAdded(int index) {
    for (var item in listAdded) {
      if (item == index) {
        return true;
      }
    }
    return false;
  }

  void rxStringListFunction(String val) {
    rxStringList.add(RxString(val));
  }

  void deleteList() {
    // employeeList.clear();
    rxStringList.clear();
  }

  void printAllSelected() {
    employeeListPresent.clear();
    print("rxstringlist   employeelist " + rxStringList.length.toString() + " " + employeeList.length.toString());

    for (int i = 0; i < employeeList.length; i++) {
      if (rxStringList[i]) {
        print("emp " + employeeList[i].name.toString());
        print("emp title " + employeeList[i].phone.toString());
        employeeListPresent.add(employeeList[i]);
      }
      //  employeeList.clear();
      //  rxStringList.clear();
    }
  }

  void assignList() {
    rxStringList.clear();
    for (var item in employeeList) {
      rxStringList.add(false);
      print("jdnjdfn");
    }
  }

  Future<void> addDateTask() async {
    try {
      printAllSelected();
      var box = await Hive.openBox('employeeBoxTask');
      print(employeeListPresent);
      var emp1 = Task.fromData(
        Date: textControllerName.value,
        content: employeeListPresent.value,
      );

      var taskOutput = box.get("taskBoxPresenting");
      print("fetch db ");
      print(taskOutput);
      if (taskOutput == null) {
        taskOutput = [];
        taskOutput.add(emp1);
        await box.put("taskBoxPresenting", taskOutput);

        taskOutput = box.get("taskBoxPresenting");
        print("present data from null");
        print(taskOutput);
        return;
      }

      print("item is printing enddddddd");
      taskOutput?.add(emp1);
      await box.put("taskBoxPresenting", taskOutput);

      taskOutput = box.get("taskBoxPresenting");
      print("present data");
      print(taskOutput);

      // box.clear();
    } catch (e) {
      print("string " + e.toString());
    }
  }
}

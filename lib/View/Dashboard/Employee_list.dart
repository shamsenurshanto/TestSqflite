import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:testhive/View/Dashboard/Employee_attendance.dart';
import 'package:testhive/View/Dashboard/Employee_controller.dart';

class employee_list extends StatefulWidget {
  const employee_list({super.key});

  @override
  State<employee_list> createState() => _employee_listState();
}

class _employee_listState extends State<employee_list> {
  @override
  final EmployeeController controller_employee = Get.put(EmployeeController());

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Obx(
      () => Container(
          height: 500,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Employee List"),
                  ElevatedButton(
                      onPressed: () {
                        showBottomSheet_add(context);
                      },
                      child: Text("Add")),
                  ElevatedButton(
                      onPressed: () {
                        controller_employee.deleteList();
                        controller_employee.storeData();
                        controller_employee.picked_date.value = "Picked date";
                        Get.to(EmplyoeeAttendance());
                      },
                      child: Text("Attandance"))
                ],
              ),
              Container(
                height: 300,
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      itemCount: controller_employee.employeeList.length,
                      itemBuilder: (context, index) {
                        // controller_employee.rxStringList.add(false);
                        print(controller_employee.rxStringList[index]);
                        print(index.toString());
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              //  controller_employee.rxStringList[index]=! controller_employee.rxStringList[index];
                              // print( controller_employee.rxStringList[index].toString()+ ' '+index.toString());
                              controller_employee.watchIcon.value = !controller_employee.watchIcon.value;
                              controller_employee.employeeList.refresh();
                            },
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller_employee.employeeList[index].name.toString(),
                                    style: const TextStyle(fontSize: 18.0),
                                  ),
                                  Text(
                                    controller_employee.employeeList[index].phone.toString(),
                                    style: const TextStyle(fontSize: 18.0),
                                  ),
                                  // Visibility(
                                  //   visible:  controller_employee.rxStringList[index],
                                  //   child: Icon(Icons.done_all,color: Colors.green,)),
                                  //   Text(controller_employee.rxStringList[index].toString())
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )),
              ),
            ],
          )),
    ))));
  }

  void showBottomSheet_add(BuildContext context) {
    TextEditingController textEditingController1 = TextEditingController();
    TextEditingController textEditingController2 = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
            child: Container(
                height: 600,
                width: 300,
                padding: EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Add Items',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: textEditingController1,
                        onChanged: (val) {
                          controller_employee.updateName(val);
                        },
                        decoration: InputDecoration(labelText: 'Name'),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: textEditingController2,
                        onChanged: (val) {
                          controller_employee.updatetitle(val);
                        },
                        decoration: InputDecoration(labelText: 'Tittle'),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Access the values entered in the text fields
                          String item1 = textEditingController1.text;
                          String item2 = textEditingController2.text;
                          controller_employee.addEmployeeList();

                          // Process the values or perform the desired action
                          print('Item 1: $item1, Item 2: $item2');

                          // Close the bottom sheet
                          Navigator.pop(context);
                        },
                        child: Text('Add'),
                      ),
                    ],
                  ),
                )));
      },
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:testhive/View/Dashboard/Employee_controller.dart';
import 'package:testhive/View/Dashboard/Employee_list.dart';

class EmplyoeeAttendance extends StatefulWidget {
  const EmplyoeeAttendance({super.key});

  @override
  State<EmplyoeeAttendance> createState() => _EmplyoeeAttendanceState();
}

class _EmplyoeeAttendanceState extends State<EmplyoeeAttendance> {
  final EmployeeController controller_employee = Get.put(EmployeeController());

  String formatDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    DateFormat formatter = DateFormat('dd / MMM / yyyy');
    return formatter.format(date);
  }

  void _showDatePicker() {
    print("date picker " + controller_employee.picked_date.value);
    showDatePicker(
      context: context,

      initialDate: DateTime.now().add(Duration(days: 2)),
      firstDate: DateTime(2022).add(Duration(days: 1)), // DateTime.now().add(Duration(days: 1)),
      lastDate: DateTime(2026),
    ).then((value) {
      //print(value);
      setState(() {
        controller_employee.picked_date.value = formatDate(value.toString());
      });
      controller_employee.addDateListDB("0");
    });
  }

  @override
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
                        controller_employee.addDateListDB("1");
                      },
                      child: Text("Add List")),
                  ElevatedButton(
                      onPressed: () {
                        _showDatePicker();
                        // controller_employee.addDateListDB();
                        // controller_employee.getDateListDB();
                      },
                      child: Text(controller_employee.picked_date.value))
                ],
              ),
              Container(
                height: 300,
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      itemCount: controller_employee.employeeList.length,
                      itemBuilder: (context, index) {
                        if (controller_employee.rxStringList.length == index) {
                          controller_employee.rxStringList.add(false);
                        }
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              controller_employee.rxStringList[index] = !controller_employee.rxStringList[index];
                              print(controller_employee.rxStringList[index].toString() + ' ' + index.toString());
                              controller_employee.watchIcon.value = !controller_employee.watchIcon.value;
                              //  controller_employee.employeeList.clear();
                              controller_employee.employeeList.refresh();
                              controller_employee.addDateListDB("1");
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
                                  Visibility(
                                      visible: controller_employee.rxStringList[index],
                                      child: Icon(
                                        Icons.done_all,
                                        color: Colors.green,
                                      )),
                                  Text(controller_employee.rxStringList[index].toString())
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
    ;
  }
}

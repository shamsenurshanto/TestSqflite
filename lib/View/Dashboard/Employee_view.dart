import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:testhive/Controller/food_card.dart';
import 'package:testhive/View/Dashboard/Employee_controller.dart';
import 'package:testhive/View/Dashboard/Employee_list.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({super.key});

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  @override
  final EmployeeController controller_employee = Get.put(EmployeeController());

  Widget build(BuildContext context) {
    print("heelo build ");
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: Container(
                height: 78,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(employee_list());
                    },
                    child: Text("employee page "))),
          ),
          Center(
            child: Container(
                height: 78,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(foodCart());
                    },
                    child: Text("food cart"))),
          ),
        ],
      )),
    ));
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            width: 300,
            height: 600,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(() => ListView.builder(
                    itemCount: controller_employee.employeeList.length,
                    itemBuilder: (context, index) {
                      controller_employee.rxStringList.add(false);
                      print(controller_employee.rxStringList[index]);
                      print(index.toString());
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            controller_employee.rxStringList[index] = !controller_employee.rxStringList[index];
                            print(controller_employee.rxStringList[index].toString() + ' ' + index.toString());
                            controller_employee.watchIcon.value = !controller_employee.watchIcon.value;
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
                                    visible: controller_employee.watchIcon.value,
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
          ),
        );
      },
    );
  }

//    void showBottomSheet_cart(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return SingleChildScrollView(
//         child: Container(
//           width: 300,
//           height: 600,
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: GetBuilder<EmployeeController>(
//     builder: (cartController) {
//         return
//         ListView.builder(
//             itemCount: ,
//             itemBuilder: (context, index) {
//                 Product product = cartController.cartItems[index];
//                 return ListTile(
//                     title: Text(product.name),
//                     subtitle: Text('Price: ${product.price}'),
//                     trailing: IconButton(
//                         onPressed: () => cartController.removeFromCart(product),
//                         icon: Icon(Icons.delete),
//                     ),
//                 );
//             },
//         );
//     },
// ),
//           ),
//         ),
//       );
//     },
//   );
// }

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

  void showBottomSheet_addDate(BuildContext context) {
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
                        'Add Date attandance',
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
                        decoration: InputDecoration(labelText: 'Type Date '),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Access the values entered in the text fields
                          String item1 = textEditingController1.text;

                          controller_employee.addDateTask();

                          // Process the values or perform the desired action
                          // print('Item 1: $item1, Item 2: $item2');

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

import 'package:cart_stepper/cart_stepper.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:testhive/Controller/attribute_controller.dart';
import 'package:testhive/Controller/dashboard_controller.dart';
import 'package:testhive/Controller/product_add_controller.dart';
import 'package:testhive/View/dashboard.dart';

import 'package:testhive/View/restaurant_profile.dart';


class ProductAdd extends StatelessWidget {
  // Define your object type (adjust properties as needed)

// Create the map with string keys and lists of MyObject values
  //all the flavoured controller
  final flavour1 = TextEditingController();
  final flavour2 = TextEditingController();
  final flavour3 = TextEditingController();
  final flavour4 = TextEditingController();
  final foodName = TextEditingController();
  final priceForm = TextEditingController();
  List<TextEditingController> finalTextEditingControllerList = [];
  List<String> stringList = ['Breakfast', 'Lunch', 'Snacks', 'Beverages', 'Others', 'Breakfast', 'Lunch'];
  final List<String> items = ['Breakfast', 'Lunch', 'Snacks', 'Beverages', 'Others', 'Breakfast', 'Lunch'];
  String? selectedValue;
  List<String> stringList2 = ['Breakfast', 'L', 'S', 'A', 'B', 'Breakfast', 'S'];
  int currentIndex = -1;
  int _counter = 2;
  final ProductAddController controllerProductAdd = Get.put(ProductAddController());
  final AttributeController controllerAttribute = Get.put(AttributeController());
  final DashboardController controllerFoodCard = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: 700,
      child: SingleChildScrollView(
          child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              "Food name",
                              style: TextStyle(fontWeight: FontWeight.w400, color: const Color.fromARGB(255, 190, 181, 181)),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 1.5,
                                spreadRadius: 0.5,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10.0), // Add some border radius
                          ),
                          child: Container(
                            width: 380,
                            color: Colors.white,
                            margin: EdgeInsets.only(bottom: 3, left: 0),
                            child: TextField(
                              controller: foodName,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                border: InputBorder.none,
                                // Remove default border
                                hintText: 'Enter your food name',
                                hintStyle: TextStyle(color: Color.fromARGB(255, 211, 211, 223)), // Set text color to red
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Padding(
                            padding: const EdgeInsets.only(left: 14.0),
                            child: Text(
                              "Select Category",
                              style: TextStyle(fontWeight: FontWeight.w400, color: const Color.fromARGB(255, 190, 181, 181)),
                            ),
                          ),
                           
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0, left: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    // Set shadow color
                                    blurRadius: 1.5,
                                    // Adjust blur radius for desired shadow softness
                                    spreadRadius: 0.5, // Adjust spread radius for shadow extent
                                  ),
                                ],
                                // borderRadius: BorderRadius.circular(10.0), // Add some border radius
                              ),
                              child: Container(
                                width: 170,
                                color: Colors.white,
                                margin: EdgeInsets.only(bottom: 3, left: 0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2<String>(
                                    isExpanded: true,
                                    hint: const Row(
                                      children: [
                                        Icon(
                                          Icons.arrow_forward_ios_sharp,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Select Category',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    items: items
                                        .map((String item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ))
                                        .toList(),
                                    value: selectedValue,
                                    onChanged: (value) {
                                      // setState(() {
                                      //   selectedValue = value;
                                      //   print(selectedValue);
                                      // });
                                    },
                                    buttonStyleData: ButtonStyleData(
                                      height: 50,
                                      width: 160,
                                      padding: const EdgeInsets.only(left: 14, right: 14),
                                      decoration: BoxDecoration(
                                        // borderRadius: BorderRadius.circular(14),
                                        border: Border.all(
                                          color: Colors.black26,
                                        ),
                                        color: Colors.white
                                      ),
                                      elevation: 0,
                                    ),
                                    iconStyleData: const IconStyleData(
                                      icon: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                      ),
                                      iconSize: 14,
                                      iconEnabledColor: Colors.white,
                                      iconDisabledColor: Colors.grey,
                                    ),
                                    dropdownStyleData: DropdownStyleData(
                                      maxHeight: 200,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Colors.white,
                                      ),
                                      offset: const Offset(-20, 0),
                                      scrollbarTheme: ScrollbarThemeData(
                                        radius: const Radius.circular(40),
                                        thickness: MaterialStateProperty.all(6),
                                        thumbVisibility: MaterialStateProperty.all(true),
                                      ),
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                      padding: EdgeInsets.only(left: 14, right: 14),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      ///price

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(
                              "Base Price",
                              style: TextStyle(fontWeight: FontWeight.w400, color: const Color.fromARGB(255, 190, 181, 181)),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0, right: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    // Set shadow color
                                    blurRadius: 1.5,
                                    // Adjust blur radius for desired shadow softness
                                    spreadRadius: 0.5, // Adjust spread radius for shadow extent
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10.0), // Add some border radius
                              ),
                              child:  Container(
                                width: 170,
                                color: Colors.white,
                                margin: EdgeInsets.only(bottom: 3, left: 0),
                                child: TextField(
                                  controller: priceForm,
                                  textAlign: TextAlign.center,
                                  // Set text alignment to center horizontally
                                  textAlignVertical: TextAlignVertical.center,
                                  // Set text alignment to center vertically
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    // Remove default border
                                    hintText: '৳ Price',
                                    // Add the style property with TextStyle
                                    hintStyle: TextStyle(color: Color.fromARGB(255, 211, 211, 223)), // Set text color to red
                                  ),
                                ),
                              ),
                               
                               
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  //text attributes
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                              child: Text(
                                "Attributes",
                                style: TextStyle(fontWeight: FontWeight.w400, color: const Color.fromARGB(255, 190, 181, 181)),
                              ),
                            ),
                          ],
                        ),

                        // attributes button
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            width: 380,

                            margin: EdgeInsets.only(bottom: 3, left: 0),
                            //attribute section

                            child: SizedBox(
                              width: 330,
                              height: 50,
                              child: Obx(() => ListView.builder(
                                    itemCount: controllerAttribute.attributeListModel.value!.attributeList.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      finalTextEditingControllerList.add(TextEditingController());
                                      return InkWell(
                                          onTap: () {
                                            print("hello object");

                                            controllerAttribute.getSelectedAttribute(index);
                                          },
                                          child: Container(
                                              margin: EdgeInsets.all(2),
                                              color: controllerAttribute.attributeListModel.value!.isSelected[index]
                                                  ? Colors.orange.withOpacity(0.8)
                                                  : Colors.orange.withOpacity(0.3),
                                              height: 60,
                                              width: 120,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: Text(
                                                      controllerAttribute.attributeListModel.value!.attributeList[index],
                                                      style:
                                                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.lime.shade50),
                                                    ),
                                                  ),
                                                ],
                                              )));
                                    },
                                  )),
                            ),
                          ),
                        ),

                        Container(
                            margin: EdgeInsets.all(10),
                            height: 300,
                            child:
                                // details about size colums

                                Obx(() => ListView.builder(
                                    itemCount: controllerAttribute.attributeListModel.value!.attributeList.length,
                                    itemBuilder: (context, index) {
                                      // controllerProductAdd.getAttributeValue();
                                      print(
                                          "size details " + controllerAttribute.attributeListModel.value!.attributeList.length.toString());
                                      print(controllerAttribute.attributeListModel.value!.isSelected[index]);
                                      return Visibility(
                                          visible: controllerAttribute.attributeListModel.value!.isSelected[index],
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  //attributes name
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 0.0, top: 10),
                                                    child: Container(
                                                      width: 80,
                                                      height: 42,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Colors.grey,
                                                          // Set border color
                                                          width: 1.0, // Set border width
                                                        ),
                                                        color: Colors.white,
                                                        // borderRadius: BorderRadius.circular(10.0),
                                                      ),
                                                      child: TextButton(
                                                        onPressed: () {
                                                          print(index);
                                                        },
                                                        child: Text(
                                                          controllerAttribute.attributeListModel.value!.attributeList[index],
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 15.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  //attribute name
                                                  // form attributes

                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 0.0, top: 10),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            border: Border.all(
                                                              color: Colors.grey.shade300,
                                                              // Set border color
                                                              width: 1.0, // Set border width
                                                            ),
                                                            color: Colors.white,
                                                            // borderRadius: BorderRadius.circular(10.0),
                                                          ),
                                                          child: Container(
                                                            width: 210,
                                                            height: 42,
                                                            color: Colors.white,
                                                            margin: EdgeInsets.only(bottom: 0, left: 0),
                                                            child: TextField(
                                                              controller: finalTextEditingControllerList[index],
                                                              decoration: const InputDecoration(
                                                                contentPadding: EdgeInsets.all(10),
                                                                border: InputBorder.none,
                                                                // Remove default border
                                                                hintText: 'Ex: Naga flavour',
                                                                hintStyle: TextStyle(
                                                                    color: Color.fromARGB(255, 211, 211, 223)), // Set text color to red
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  //add button s

                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 3, top: 10),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Colors.grey.shade300,
                                                          // Set border color
                                                          width: 1.0, // Set border width
                                                        ),
                                                        color: Colors.white,
                                                        // borderRadius: BorderRadius.circular(10.0),
                                                      ),
                                                      child: Container(
                                                        width: 70,
                                                        height: 42,
                                                        margin: EdgeInsets.only(bottom: 0, left: 0),
                                                        decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors.blue,
                                                            // Set border color
                                                            width: 1.0, // Set border width
                                                          ),
                                                          color: const Color.fromRGBO(33, 150, 243, 1),
                                                          // borderRadius: BorderRadius.circular(10.0),
                                                        ),
                                                        child: TextButton(
                                                          onPressed: () {
                                                            controllerProductAdd.addAttributeSize(
                                                                index, finalTextEditingControllerList[index].text);
                                                            finalTextEditingControllerList[index].clear();
                                                          },
                                                          child: const Text(
                                                            "Add",
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 15.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              //extra wrapper if added in the array
                                                Obx(
                                                () => Container(
                                                  // margin: EdgeInsets.only(right: 3),
                                                    child: Wrap(
                                                      children: [
                                                        for (int i = 0; i < controllerProductAdd.Lstring[index].length; i++)
                                                          Flexible(
                                                            child: Container(
                                                              margin: EdgeInsets.only(right: 5,top: 5),
                                                              padding: EdgeInsets.all(5),
                                                                color: Colors.red.withOpacity(0.5),
                                                              child: Row(
                                                                mainAxisSize: MainAxisSize.min,
                                                                children: [
                                                                  Text(
                                                                    controllerProductAdd.Lstring[index][i],
                                                                    style: TextStyle(color: Colors.white,
                                                                    fontWeight: FontWeight.w500
                                                                    ),
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      controllerProductAdd.removeAtrribute(0);
                                                                    },
                                                                    child: Icon(
                                                                      Icons.delete_forever_rounded,
                                                                      color: Colors.white,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  
                                                  ),
                                                )


                                              
                                            ],
                                          ));
                                    }))),
                      ],
                    ),
                  ),
                  //attributes column details demoo

                  // save button

                  Visibility(
                    visible: true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Container(
                              width: 130,
                              height: 42,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  // Set border color
                                  width: 1.0, // Set border width
                                ),
                                color: controllerProductAdd.attributesButtonsSize.value ? Colors.teal : Colors.teal,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: TextButton(
                                onPressed: () async {
                                 await controllerProductAdd.addProductToDB(foodName.text, priceForm.text);
                                List<Map<String, dynamic>>  passTOSubProductAdd =  await  controllerFoodCard.getData(stringList2[0]);
                                  
                                  if(passTOSubProductAdd.isNotEmpty)
                                  {
                                     print(controllerFoodCard.foodListDashBoard.length);
                                     Get.toNamed('/second', arguments: passTOSubProductAdd);
                                  }
                             
                                
                                },
                                child: const Text(
                                  "Save Attribute",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    ));
  }
}

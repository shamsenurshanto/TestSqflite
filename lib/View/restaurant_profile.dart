import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:testhive/Controller/attribute_controller.dart';

import '../Controller/dashboard_controller.dart';

class RestaurantProfile extends StatelessWidget {
  const RestaurantProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final AttributeController controllerAttribute = Get.put(AttributeController());

    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //images
                Center(
                  child: Container(
                    child: ClipOval(
                      child: Image.network(
                        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        // Replace with your image URL
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
            GestureDetector(
                onTap: () {
                  print("settings ");
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 340.0,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                  child: Obx(
                                () => Wrap(
                                  spacing: 5.0, // Add spacing between cards (optional)
                                  children: [
                                    for (String word
                                        in controllerAttribute.attributeListModel.value!.attributeList)
                                      Container(
                                          height: 70,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Card(
                                                color: Colors.red.withOpacity(0.5),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      word,
                                                      style: TextStyle(color: Colors.white),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Icon(
                                                        Icons.delete_forever_rounded,
                                                        color: Colors.white,
                                                      ),
                                                    )
                                                  ],
                                                )),
                                          )),
                                  ],
                                ),
                              )),
                              Container(
                                  height: 70,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        print("jjd add more");
                                        showMyDialog(context);
                                      },
                                      child: Card(
                                          color: Colors.green.withOpacity(0.5),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Add more attribute",
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ],
                                          )),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: 120,
                  height: 30,
                  child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 233, 149, 177),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0), // Top left corner
                          bottomRight: Radius.circular(20.0), // Bottom right corner
                        ),
                      ),
                      child: Center(
                          child: Text(
                        "Settings ",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ))),
                )),
          ],
        ),
      ),
    ));
  }
}

void showMyDialog(BuildContext context) {
  // Create a TextEditingController to handle the text input
  TextEditingController textEditingController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      final AttributeController controllerAttribute = Get.put(AttributeController());
      return AlertDialog(
        title: Text('Attribute Name'),
        content: TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: 'Add attribute name',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Close the dialog and print the entered text
              Navigator.of(context).pop();
              controllerAttribute.addAttributetoList(textEditingController.text);
              print('Entered Text: ${textEditingController.text}');
            },
            child: Text('OK'),
          ),
          TextButton(
            onPressed: () {
              // Close the dialog without doing anything
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
        ],
      );
    },
  );
}

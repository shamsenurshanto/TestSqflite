import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testhive/Controller/category_controller.dart';
import 'package:testhive/Controller/dashboard_controller.dart';
import 'package:testhive/Model/add_to_cart_model.dart';
import 'package:testhive/View/dashboard.dart';
import 'package:testhive/View/restaurant_profile.dart';

import '../../Controller/add_to_cart_controller.dart';

class SubProductAdd extends StatelessWidget {
  const SubProductAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController controllerFoodCard = new DashboardController();
    final CategoryController categoryController = new CategoryController();
    final String shImages = 'https://yrf.com.au/wp-content/uploads/2021/09/placeholder-wire-image.jpg';

    final List<Map<String, dynamic>> data = Get.arguments;
    int index = 0;
    int firstIdOnly = -1;
    data.forEach((element) {
      if (firstIdOnly == element['foodName_id']) {
        //  print(element);
        controllerFoodCard.foodListDashBoard.add(element);
      }
      if (firstIdOnly == -1) {
        //  print(element);
        firstIdOnly = element['foodName_id'];
        controllerFoodCard.foodListDashBoard.add(element);
      }
    });
    print(controllerFoodCard.foodListDashBoard.length);

    return Scaffold(
      body: Column(
        children: [
          SingleChildScrollView(
              child: Container(
            // height: 800,
            // color: Colors.red,
            child: Obx(() => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 38.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Image.network(
                              // modal er image
                              shImages,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    controllerFoodCard.foodListDashBoard[index]['foodName_name'],
                                    style: GoogleFonts.laila(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                                  ),
                                  Text(
                                    "৳${controllerFoodCard.foodListDashBoard[index]['price']}",
                                    style: GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    print("icon hello");
                                    Get.to(const RestaurantProfile());
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    size: 20,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),

                    ///attribute columns of bottom module
                    Column(
                      children: [
                        Container(
                            height: 700,
                            width: 300,
                            child: ListView.builder(
                                itemCount: controllerFoodCard.foodListDashBoard.length,
                                itemBuilder: (BuildContext contex, int index) {
                                  // print(controllerFoodCard.productDetailsList[index].values);
                                  print('values');

                                  Widget textWidget = buildTextFromMap(controllerFoodCard.foodListDashBoard[index]);
                                  print('values2');
                                  // controllerFoodCard.productDetailsList.refresh();
                                  // print(index);
                                  return Container(
                                    child: Row(
                                      children: [textWidget],
                                    ),
                                  );
                                })),

                        //attribute of size
                      ],
                    ),
                  ],
                )),
          ))
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              showBottomModal(context);
              print('Floating Action Button pressed');
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: Colors.deepPurple,
          ),
          SizedBox(height: 8), // Add some spacing between FAB and text
          Text(
            'Add Food',
            style: GoogleFonts.laila(fontSize: 18, fontWeight: FontWeight.w900, color: Colors.deepPurple),
          ),
        ],
      ),
    );
  }

  void showBottomModal(BuildContext context) {
    showModalBottomSheet<void>(
      // isScrollControlled: true,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: 800,
          // width: 320,
          color: Colors.white,
          padding: const EdgeInsets.all(20.0),
        );
      },
    ); // Handle modal result if needed
  }

  Widget buildTextFromMap(Map<String, dynamic> data) {
    List<Widget> widgets = [];

    var boolListForAttributeValuesButton = <bool>[].obs;

    print(
        data['foodName_name'] + ' ' + data['foodName_id'].toString() + ' ' + data['attributeList_name'] + data['attributeList'].toString());
    List<String> attributeListFromFoodDashboardList = data['attributeList'].split(',');
    attributeListFromFoodDashboardList.forEach((element) {
      print(element);
    });
    print('data buildTextFromMap ' + attributeListFromFoodDashboardList[0]);
    if (attributeListFromFoodDashboardList[0].length > 0) {
      widgets.add(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 00.0, top: 30),
            child: Text(
              data['attributeList_name'],
              style: GoogleFonts.laila(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.grey),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            // Adjust the height as needed
            width: 300,
            // color: Colors.red,

            child: Wrap(
              children: List.generate(
                attributeListFromFoodDashboardList.length,
                (index) {
                  boolListForAttributeValuesButton.add(false);
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: Obx(
                      () => InkWell(
                        onTap: () {
                          print("clicked");
                          boolListForAttributeValuesButton[index] = !boolListForAttributeValuesButton[index];
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: boolListForAttributeValuesButton[index]
                                ? Colors.deepPurpleAccent.withOpacity(0.2)
                                : Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(0), // Rounded border radius
                            border: Border.all(
                              color: boolListForAttributeValuesButton[index] ? Colors.deepPurpleAccent : Colors.grey,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              attributeListFromFoodDashboardList[index],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: boolListForAttributeValuesButton[index] ? Colors.deepPurpleAccent : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}

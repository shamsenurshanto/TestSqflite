import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testhive/Controller/category_controller.dart';
import 'package:testhive/Controller/dashboard_controller.dart';
import 'package:testhive/Model/add_to_cart_model.dart';
import 'package:testhive/View/dashboard.dart';
import 'package:testhive/View/restaurant_profile.dart';

class SubProductAdd extends StatelessWidget {
  const SubProductAdd({super.key});

  @override
  Widget build(BuildContext context) {
     final DashboardController controllerFoodCard = new DashboardController();
     final CategoryController categoryController = new CategoryController();
       final String shImages = 'https://yrf.com.au/wp-content/uploads/2021/09/placeholder-wire-image.jpg';
       
        final List<Map<String, dynamic>>  data = Get.arguments;
        int index =0;
        data.forEach((element) {
          print(element);
           controllerFoodCard.foodListDashBoard.add(element);
           
        });
       

       

    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text("hhelo"),
          ),
         SingleChildScrollView(
                child: Container(
                    // height: 800,
                    child:Obx(() => 
                      Column(
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
                                    "৳" + controllerFoodCard.foodListDashBoard[index]['price'].toString().toString(),
                                    style: GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    print("icon hello");
                                    Get.to(RestaurantProfile());
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    size: 20,
                                  )),
                             ],
                          ),
                          SizedBox(
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
                                  itemCount: controllerFoodCard.productDetailsList.length,
                                  itemBuilder: (BuildContext contex, int index) {
                                    print(controllerFoodCard.productDetailsList[index].values);
                                    print('values');

                                    Widget textWidget = buildTextFromMap(controllerFoodCard.productDetailsList[index]);
                                    // controllerFoodCard.productDetailsList.refresh();
                                    // print(index);
                                    return Wrap(
                                      children: [textWidget],
                                    );
                                  })),

                          //attribute of size
                        ],
                      ),
                    
                  ],
                )),
           )
                      )
          
        ],
      ),
    );
  }
   Widget buildTextFromMap(Map<String, List<String>> data) {
    List<Widget> widgets = [];
    print(data);
    var boolListForAttributeValuesButton = <bool>[].obs;
   
    data.forEach((key, value) {
      print(value);
      print('valiu');
      if (value[0].isNotEmpty)
        widgets.add(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 00.0, top: 30),
              child: Text(
                '$key',
                style: GoogleFonts.laila(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.grey),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 50, // Adjust the height as needed
              width: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: value.length,
                itemBuilder: (BuildContext context, int index) {
                  boolListForAttributeValuesButton.add(false);
                  return Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Obx(() => InkWell(
                            onTap: () {
                              print("clicked");
                              boolListForAttributeValuesButton[index] = !boolListForAttributeValuesButton[index];
                            },
                            child:  Container(
                                // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                // margin: EdgeInsets.all(3),

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
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      value[index],
                                      style: GoogleFonts.laila(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: boolListForAttributeValuesButton[index] ? Colors.deepPurpleAccent : Colors.grey,
                                      ),
                                    ),
                                  ),
                                )),
                          )));
                },
              ),
            )
          ],
        ));
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

}
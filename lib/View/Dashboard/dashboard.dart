import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:testhive/Controller/add_to_cart_controller.dart';
import 'package:testhive/Controller/attribute_controller.dart';
import 'package:testhive/Controller/dashboard_controller.dart';
import 'package:testhive/Controller/product_add_controller.dart';
import 'package:testhive/Model/add_to_cart_model.dart';
import 'package:testhive/View/Demo%20view/demo.dart';
import 'package:testhive/View/Demo%20view/demoController.dart';
import 'package:testhive/View/Product_Add/product_add.dart';
import 'package:testhive/View/restaurant_profile.dart';
import 'package:vertical_scrollable_tabview/vertical_scrollable_tabview.dart';

class DashBoard extends StatelessWidget {
  final String shImages = 'https://yrf.com.au/wp-content/uploads/2021/09/placeholder-wire-image.jpg';

  const DashBoard({super.key});
  printFyn() {
    print("heelo");
  }

  @override
  Widget build(BuildContext context) {
    final DemoController demoController = new DemoController();
    demoController.setItemVarriationPriceModel();
    final List<String> tabTitles = [
      'Tab 1',
      'Tab 2',
      'Tab 3',
      'Tab 4',
      'Tab 5',
    ];

    return Obx(
      () => DefaultTabController(
          length: demoController.itemVarriationPriceModel.length,
          child: Scaffold(
              body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                    title: const Text('Tabs Demo',
                        style: TextStyle(
                          color: Color.fromARGB(255, 230, 127, 161),
                        )),
                    pinned: true,
                    floating: true,
                    backgroundColor: Colors.white.withOpacity(0.992),
                    bottom: TabBar(
                      isScrollable: true,
                      indicatorColor: Colors.pink.withOpacity(1),
                      labelColor: Colors.pink.withOpacity(1),
                      unselectedLabelColor: Colors.grey,
                      onTap: (index) async {
                        print(demoController.itemVarriationPriceModel[index].name +
                            " " +
                            demoController.itemVarriationPriceModel[index].id.toString());
                        await demoController.fetchDataUsingCategoryId(demoController.itemVarriationPriceModel[index].id);
                      },
                      tabs: [
                        for (int i = 0; i < demoController.itemVarriationPriceModel.length; i++)
                          Tab(
                              child: Container(
                            width: 100,
                            height: 20,
                            child: Center(
                                child: Text(
                              demoController.itemVarriationPriceModel[i].name,
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            )),
                          )),
                      ],
                    )),
              ];
            },
            body: TabBarView(
              children: <Widget>[
                for (int i = 0; i < demoController.itemVarriationPriceModel.length; i++)
                  for (int i2 = 0; i2 < demoController.itemUnderCategoryModelList.length && demoController.currentId.value == i; i2++)
                    InkWell(
                      onTap: () {
                        print("huuuuu");
                      },
                      child: Container(
                          constraints: BoxConstraints(
                            minHeight: 90, // Set the minimum height here
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5.0),
                              bottomRight: Radius.circular(5.0),
                            ),
                            border: Border.all(
                              color: Color.fromARGB(107, 230, 171, 190),
                              // Specify border color here
                              width: 1.0, // Specify border width here
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15.0),
                                      child: Text(
                                        demoController.itemUnderCategoryModelList[i2].MainName,
                                        style: GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.pinkAccent),
                                      ),
                                    ),
                                    // for (int i3 = 0; i3 < 3; i3++) // loop 3
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "- ",
                                          style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
                                        ),
                                        Text(
                                          demoController.itemUnderCategoryModelList[i2].attrName,
                                          style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          "৳" + demoController.itemUnderCategoryModelList[i2].attrPrice.toString(),
                                          style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          )),
                    ),
              ],
            ),
          ))),
    );
  }
}

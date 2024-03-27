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
    final List<String> tabTitles = [
      'Tab 1',
      'Tab 2',
      'Tab 3',
      'Tab 4',
      'Tab 5',
    ];

    return DefaultTabController(
      length: 5,
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
                  tabs: [
                    for (int i = 0; i < tabTitles.length; i++)
                      Tab(
                          child: Container(
                        width: 100,
                        height: 20,
                        child: Center(
                            child: Text(
                          tabTitles[i],
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                      )),
                  ],
                )),
          ];
        },
        body: TabBarView(
          children: <Widget>[
            for (int i = 0; i < tabTitles.length; i++) Icon(Icons.add_a_photo, size: 350),
          ],
        ),
      )),
    );
  }
}

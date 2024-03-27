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
            new SliverAppBar(
              title: Text('Tabs Demo', style: TextStyle(color: Colors.white)),
              pinned: true,
              floating: true,
              backgroundColor: Colors.pink.withOpacity(0.1992),
              bottom: TabBar(
                isScrollable: true,
                indicatorColor: Colors.black,
                tabs: [
                  for (int i = 0; i < tabTitles.length; i++)
                    Tab(
                        child: Container(
                      width: 100,
                      height: 20,
                      child: Center(
                          child: Text(
                        tabTitles[i],
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                    )),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          children: <Widget>[
            demoDartView(),
            Icon(Icons.directions_transit, size: 350),
            Icon(Icons.directions_car, size: 350),
            Icon(Icons.directions_bike, size: 350),
            Icon(Icons.directions_boat, size: 350),
          ],
        ),
      )),
    );
  }
}

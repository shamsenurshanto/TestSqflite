import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:testhive/Controller/attribute_controller.dart';
import 'package:testhive/Controller/dashboard_controller.dart';
import 'package:testhive/Controller/product_add_controller.dart';
import 'package:testhive/View/product_add.dart';
import 'package:testhive/View/restaurant_profile.dart';

class DashBoard extends StatelessWidget {
  final String shImages =
      'https://www.cityu.edu.hk/sklmp/sites/g/files/asqsls7251/files/default_images/dummy-post-horisontal.jpg';

  const DashBoard({super.key});

  void showBottomModal(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 670,
          color: Colors.white,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Title
              Text(
                'This is a showBottom modal pls define it with this',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 10.0),

              // Content (replace with your specific content)
              Text(
                'This is some content that appears in the modal.',
              ),
              const SizedBox(height: 10.0),

              // Action buttons (replace with your desired actions)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    child: const Text('Close'),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 10.0),
                  ElevatedButton(
                    child: const Text('Confirm'),
                    // Replace with your action logic
                    onPressed: () => Navigator.pop(context, 'confirmed'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ); // Handle modal result if needed
  }

  @override
  Widget build(BuildContext context) {
    final AttributeController controllerAttribute = Get.put(AttributeController());

    List<String> stringList = [
      'Breakfast',
      'Lunch',
      'Snacks',
      'Beverages',
      'Others',
      'Breakfast',
      'Lunch'
    ];
    List<String> stringList2 = ['Breakfast', 'L', 'S', 'A', 'B', 'Breakfast', 'S'];
    int currentIndex = -1;
    int _counter = 2;
    final DashboardController controllerFoodCard = Get.put(DashboardController());
    final ProductAddController controllerProductCreate = Get.put(ProductAddController());
    String showName = '0';
    int currentName = 0;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200-10,
            collapsedHeight: 60,
            floating: false,
            iconTheme: IconThemeData(
              color: Colors.deepPurple.shade50,
            ),
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
              color: Colors.white,
              child: Image.network(
                'https://images.unsplash.com/photo-1504674900247-0877df9cc836?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                fit: BoxFit.cover,
              ),
            )),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  // Change this line to use a different icon
                  onPressed: () {
                    // Add your onPressed logic here
                    print("here the prev button ");
                    Get.back();
                  },
                ),
              ),
            ),
            title: Text(
              "F O O D D D I E S ",
              style: TextStyle(color: Color.fromARGB(255, 152, 114, 223)),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 3),
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: stringList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.only(top: 3, left: 15, bottom: 3),
                            child: Container(
                                child: Obx(
                              () => ElevatedButton(
                                onPressed: () {
                                  currentIndex = index;
                                  controllerFoodCard.indexOfClickedButton.value = index;
                                  controllerFoodCard.getData(stringList2[index]);
                                  print("obx " + controllerFoodCard.statusShow.toString());
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: controllerFoodCard.indexOfClickedButton.value == index
                                      ? Colors.white
                                      : Colors.grey.shade50,
                                  // Change the button color here
                                  onPrimary: controllerFoodCard.indexOfClickedButton.value == index
                                      ? Colors.grey
                                      : Colors.white,
                                  // Change the text color here
                                ),
                                child: Text(
                                  stringList[index],
                                  style: GoogleFonts.laila(
                                      fontSize: 20,
                                      color: currentIndex == index
                                          ? Colors.deepPurple
                                          : Colors.deepPurple.shade200,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            )));
                      })),
            ),
          ),
          SliverToBoxAdapter(
              child: Obx(
            () => Container(
                margin: EdgeInsets.only(bottom: 30),
                height: 500,
                child: controllerFoodCard.statusShow.value == '0'
                    ? SizedBox(
                        child: Shimmer.fromColors(
                            baseColor: Colors.deepPurple.shade50,
                            highlightColor: Colors.deepPurple.shade100,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      color: Colors.grey,
                                      margin: EdgeInsets.only(left: 10, right: 10, top: 31),
                                      height: 100,
                                      width: 110,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          color: Colors.grey,
                                          margin: EdgeInsets.only(left: 10, right: 10, top: 11),
                                          height: 15,
                                          width: 240,
                                        ),
                                        Container(
                                          color: Colors.grey,
                                          margin: EdgeInsets.only(left: 10, right: 10, top: 11),
                                          height: 15,
                                          width: 200 - 20,
                                        ),
                                        Container(
                                          color: Colors.grey,
                                          margin: EdgeInsets.only(left: 10, right: 10, top: 11),
                                          height: 15,
                                          width: 160,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      color: Colors.grey,
                                      margin: EdgeInsets.only(left: 10, right: 10, top: 31),
                                      height: 100,
                                      width: 110,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          color: Colors.grey,
                                          margin: EdgeInsets.only(left: 10, right: 10, top: 11),
                                          height: 15,
                                          width: 240,
                                        ),
                                        Container(
                                          color: Colors.grey,
                                          margin: EdgeInsets.only(left: 10, right: 10, top: 11),
                                          height: 15,
                                          width: 200 - 20,
                                        ),
                                        Container(
                                          color: Colors.grey,
                                          margin: EdgeInsets.only(left: 10, right: 10, top: 11),
                                          height: 15,
                                          width: 160,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      color: Colors.grey,
                                      margin: EdgeInsets.only(left: 10, right: 10, top: 31),
                                      height: 100,
                                      width: 110,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          color: Colors.grey,
                                          margin: EdgeInsets.only(left: 10, right: 10, top: 11),
                                          height: 15,
                                          width: 240,
                                        ),
                                        Container(
                                          color: Colors.grey,
                                          margin: EdgeInsets.only(left: 10, right: 10, top: 11),
                                          height: 15,
                                          width: 200 - 20,
                                        ),
                                        Container(
                                          color: Colors.grey,
                                          margin: EdgeInsets.only(left: 10, right: 10, top: 11),
                                          height: 15,
                                          width: 160,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            )),
                      )
                    : ListView.builder(
                        itemCount: controllerFoodCard.foodListDashBoard.length,
                        itemBuilder: (context, index) {
                          controllerFoodCard.arrayof.add(0);
                          //as after joining two table there can be many repitation for one food name
                          if (showName !=
                              controllerFoodCard.foodListDashBoard[index]['foodName_name']) {
                            currentName = 1;
                          } else {
                            currentName = 0;
                          }
                          showName = controllerFoodCard.foodListDashBoard[index]['foodName_name'];
                          controllerFoodCard.listString.add([]);
                          return currentName == 1
                              ? foodCartModel(context, index)
                              : SizedBox();
                        })),
          ))
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Adjust the spacing between the buttons
          Stack(
            children: [
              FloatingActionButton(
                onPressed: () {
                  // Add your onPressed logic for the second button here
                  print('Second Floating Action Button Pressed!');
                  showBottomModal(context);
                },
                child: Icon(
                  Icons.card_travel,
                  size: 30,
                  color: Colors.deepPurple[300],
                ),
                backgroundColor: Colors.white,
              ),
              Positioned(
                  left: 33,
                  child: Obx(() => Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        // Set the background color
                        borderRadius: BorderRadius.circular(50), // Set the border radius
                      ),
                      child: Center(
                        child: Text(
                          controllerFoodCard.indi.toString(),
                          style: TextStyle(
                              color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ))))
            ],
          ),
          SizedBox(
            height: 5,
          ),

          FloatingActionButton(
            onPressed: () {
              // Add your onPressed logic for the first button here
              print('First Floating Action Button Pressed!');
              controllerProductCreate.onInit();
              Get.to(ProductAdd());
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            backgroundColor: Colors.deepPurple[300],
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );

  }



  Widget foodCartModel(BuildContext contex,int index){
    final DashboardController controllerFoodCard = Get.put(DashboardController());
    final AttributeController controllerAttribute = Get.put(AttributeController());
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 3),

      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 245, 244, 246),
        // Adjust the value for roundness
      ),
      child: InkWell(
        onTap: () {
          int i = 0;
          print("hellodss ");
          controllerFoodCard.joinAndFilterById(controllerFoodCard
              .foodListDashBoard[index]['foodName_id']);
          showModalBottomSheet(
            isScrollControlled: true,
            context: contex,
            builder: (BuildContext context) {
              return Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    controllerFoodCard
                                        .foodListDashBoard[index]
                                    ['foodName_name'],
                                    style: GoogleFonts.laila(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurple),
                                  ),
                                  Text(
                                    "৳" +
                                        controllerFoodCard
                                            .foodListDashBoard[index]
                                        ['price']
                                            .toString()
                                            .toString(),
                                    style: GoogleFonts.roboto(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurple),
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
                                  ))
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),

                      ///attribute columns of bottom module
                      Obx(
                            () => Container(

                              height: 500,
                              width: double.infinity,// Adjust the height as needed
                              child: ListView.builder(
                                itemCount: controllerAttribute.attributeListModel.value?.attributeList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 28.0, top: 30),
                                    child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controllerAttribute.attributeListModel.value!.attributeList[index],
                                          style: GoogleFonts.laila(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500,
                                            color: controllerFoodCard.indiSizeAttribute.value ? Colors.deepPurple : Colors.grey,
                                          ),
                                        ),
                                        Container(
                                          height: 100, // Adjust the height as needed
                                          child: ListView.builder(
                                            itemCount:controllerFoodCard.productDetailsList.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context, int index2) {
                                              print(controllerFoodCard.productDetailsList[index].keys);
                                            List<String>mapList = controllerFoodCard.productDetailsList[index].values.first;
                                              return Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child:Wrap(
                                                      spacing: 2,
                                                  children: [
                                                    for(String word in mapList)
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text(
                                                          word,
                                                          style: GoogleFonts.laila(
                                                            fontSize: 30,
                                                            fontWeight: FontWeight.w500,
                                                            color: controllerFoodCard.indiSizeAttribute.value ? Colors.deepPurple : Colors.grey,
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                )
                                              );
                                            },
                                          ),
                                        )

                                      ],
                                    ),
                                  );
                                },
                              ),
                            )

                      )
                    ],
                  ));
            },
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 130,
              height: 100,
              margin: EdgeInsets.all(1),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),

                ),
                child: Image.network(
                  shImages,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4.0,left: 4,bottom: 3),
                  child: controllerFoodCard
                      .foodListDashBoard[index]
                  ['foodName_name']
                      .length <
                      12
                      ? Text(
                    controllerFoodCard.foodListDashBoard[index]
                    ['foodName_name'],
                    style: GoogleFonts.aBeeZee(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.deepPurple),
                  )
                      : Text(
                    controllerFoodCard.foodListDashBoard[index]
                    ['foodName_name']
                        .substring(0, 12) +
                        "...",
                    style: GoogleFonts.laila(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controllerFoodCard.getDecrease(
                                    index,
                                    controllerFoodCard
                                        .arrayof[index]);
                              },
                              child: Icon(
                                Icons.minimize,
                                color: Colors.white,
                                size: 23,
                              ),
                            ),
                          ],
                        )),
                    Obx(
                          () => Text(controllerFoodCard.arrayof[index]
                          .toString()),
                    ),
                    GestureDetector(
                        onTap: () {
                          controllerFoodCard.getIncrease(index,
                              controllerFoodCard.arrayof[index]);
                          // print(_counter);
                        },
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
            SizedBox(
              width: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 13.0),
                  child: Text(
                    '৳' +
                        controllerFoodCard.foodListDashBoard[index]
                        ['price']
                            .toString(),
                    style: GoogleFonts.laila(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}

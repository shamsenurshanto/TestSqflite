import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:testhive/Controller/add_to_cart_controller.dart';
import 'package:testhive/Controller/attribute_controller.dart';
import 'package:testhive/Controller/dashboard_controller.dart';
import 'package:testhive/Controller/product_add_controller.dart';
import 'package:testhive/Model/add_to_cart_model.dart';
import 'package:testhive/View/product_add.dart';
import 'package:testhive/View/restaurant_profile.dart';

class DashBoard extends StatelessWidget {
  final String shImages =
      'https://yrf.com.au/wp-content/uploads/2021/09/placeholder-wire-image.jpg';

  const DashBoard({super.key});



  @override
  Widget build(BuildContext context) {
    final AttributeController controllerAttribute = Get.put(AttributeController());

    List<String> stringList = ['Breakfast', 'Lunch', 'Snacks', 'Beverages', 'Others', 'Breakfast', 'Lunch'];
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
            expandedHeight: 200 - 10,
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
                          if (showName != controllerFoodCard.foodListDashBoard[index]['foodName_name']) {
                            currentName = 1;
                          } else {
                            currentName = 0;
                          }
                          showName = controllerFoodCard.foodListDashBoard[index]['foodName_name'];
                          controllerFoodCard.listString.add([]);
                          return currentName == 1 ?
                          foodCartModel(context, index)
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
                  Icons.shopping_cart,
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
                          style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
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

  void showBottomModal(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        final AddToCartController addToCartController = Get.put(AddToCartController());
        final  DashboardController controllerFoodCard = Get.put(DashboardController());
        return Container(
          height: 670,
          // width: 320,
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
              Obx(() =>   Container(

                height: 500,
                width: 330,
                child: ListView.builder(
                    itemCount: addToCartController.addToCartList.length,
                    itemBuilder: (BuildContext context,int index){

                      return
                        Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), // Adjust the border radius as needed
                          border: Border.all(color: Colors.deepPurpleAccent.withOpacity(.15)), // Border color
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.5), // Shadow color
                              spreadRadius: 5, // Spread radius
                              blurRadius: 7, // Blur radius
                              offset: Offset(0, 3), // Offset
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 70,
                              height: 80,
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
                                  padding: const EdgeInsets.only(top: 4.0, left: 4, bottom: 10),
                                  child: addToCartController.addToCartList[index].name.length < 12
                                      ? Text(
                                    addToCartController.addToCartList[index].name,
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 13, fontWeight: FontWeight.w700, color: Colors.deepPurple),
                                  )
                                      : Text(
                                    addToCartController.addToCartList[index].name.substring(0, 12) +
                                        "...",
                                    style: GoogleFonts.laila(
                                        fontSize: 12, fontWeight: FontWeight.bold, color: Colors.deepPurple),
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
                                                controllerFoodCard.getDecrease(index, controllerFoodCard.arrayof[index]);
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
                                          () => Text(addToCartController.addToCartList[index].amount.toString()),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          controllerFoodCard.getIncrease(index, controllerFoodCard.arrayof[index]);
                                          addToCartController.setAddToCartListAmount(index);
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
                                    '৳' + addToCartController.addToCartList[index].price.toString(),
                                    style: GoogleFonts.laila(
                                        fontSize: 21, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                                              );
                    }),
              ))



            ],
          ),
        );
      },
    ); // Handle modal result if needed
  }

  Widget foodCartModel(BuildContext contex, int index) {
    final DashboardController controllerFoodCard = Get.put(DashboardController());
    final AttributeController controllerAttribute = Get.put(AttributeController());
    final AddToCartController addToCartController = Get.put(AddToCartController());
    // final AddToCartController a
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
          controllerFoodCard.joinAndFilterById(controllerFoodCard.foodListDashBoard[index]['foodName_id']);
          addToCartController.saveIdForLaterAddToCart.value = controllerFoodCard.foodListDashBoard[index]['foodName_id'];
          controllerFoodCard.setTexteditingControllerValue(controllerFoodCard.arrayof[index].toString(), index);
          showModalBottomSheet(
            isScrollControlled: true,
            context: contex,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                child: Container(
                    // height: 800,
                    child: Column(
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
                                        style: GoogleFonts.laila(
                                            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                                      ),
                                      Text(
                                        "৳" +
                                            controllerFoodCard.foodListDashBoard[index]['price']
                                                .toString()
                                                .toString(),
                                        style: GoogleFonts.roboto(
                                            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepPurple),
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
                                  InkWell(
                                    onTap: () {
                                      // Handle button press action here
                                      AddToCartModel addToCartModel = new AddToCartModel(id:addToCartController.saveIdForLaterAddToCart.value, name: controllerFoodCard.foodListDashBoard[index]['foodName_name'], index: index, amount: controllerFoodCard.arrayof[index], price: controllerFoodCard.foodListDashBoard[index]['price']);
                                      addToCartController.addProductToCart(addToCartModel);
                                      Navigator.pop(context); // Close the bottom sheet on button press

                                    },
                                    borderRadius: BorderRadius.circular(20.0), // Adjust for desired roundness
                                    child: Container(
                                        height: 60,
                                        width: 80,
                                        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0), // Adjust padding as needed
                                        decoration: BoxDecoration(
                                          color: Colors.deepPurpleAccent, // Change color to your preference
                                          borderRadius: BorderRadius.circular(20.0), // Match corner radius with InkWell
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.deepPurpleAccent.withOpacity(0.7), // Subtle shadow for depth
                                              offset: Offset(2.0, 2.0), // Adjust shadow offset for desired effect
                                              blurRadius: 4.0, // Control shadow blur radius
                                            ),
                                          ],
                                        ),
                                        child:Center(
                                            child:Icon(Icons.add_shopping_cart_outlined,size: 30,color: Colors.white,)
                                        )
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ),

                        Container(
                          width: 280,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.withOpacity(.6),
                            borderRadius: BorderRadius.circular(25), // Adjust the radius as needed
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 50,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controllerFoodCard.getDecrease(index, controllerFoodCard.arrayof[index]);
                                        },
                                        child: Icon(
                                          Icons.minimize,
                                          color: Colors.deepPurpleAccent,
                                          size: 23,
                                        ),
                                      ),
                                    ],
                                  )),
                              Obx(
                                      () => Container(
                                    width: 70,
                                    height: 50,
                                    child:   TextFormField(
                                      controller: controllerFoodCard.textEditingControllerForModal,
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      style: const TextStyle(color: Colors.white,fontSize: 24),
                                      onChanged: (val){
                                        controllerFoodCard.setTexteditingControllerValue(val,index);
                                      },
                                      decoration: InputDecoration(
                                        hintText:   controllerFoodCard.arrayof[index].toString(),
                                        hintStyle: TextStyle(fontSize: 20, color: Colors.white),

                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white), // Set the border color here
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white), // Adjust focused border color if needed
                                        ),

                                      ),
                                    ),
                                  )
                              ),
                              InkWell(
                                  onTap: () {
                                    controllerFoodCard.getIncrease(index, controllerFoodCard.arrayof[index]);
                                    // print(_counter);
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                  )),
                            ],
                          ),
                        ),

                        ///attribute columns of bottom module
                        Obx(
                              () => Column(
                            children: [

                              Container(
                                  height:700,
                                  width: 300,
                                  child:  ListView.builder(
                                      itemCount: controllerFoodCard.productDetailsList.length,
                                      itemBuilder: (BuildContext contex,int index){
                                        print(controllerFoodCard.productDetailsList[index].values);
                                        print('values');

                                        Widget textWidget = buildTextFromMap(controllerFoodCard.productDetailsList[index]);
                                        // controllerFoodCard.productDetailsList.refresh();
                                        // print(index);
                                        return   Wrap(

                                          children: [

                                            textWidget



                                          ],
                                        );
                                      })
                              ),




                              //attribute of size
                            ],
                          ),
                        )
                      ],
                    )),
              );
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
                  padding: const EdgeInsets.only(top: 4.0, left: 4, bottom: 3),
                  child: controllerFoodCard.foodListDashBoard[index]['foodName_name'].length < 12
                      ? Text(
                          controllerFoodCard.foodListDashBoard[index]['foodName_name'],
                          style: GoogleFonts.aBeeZee(
                              fontSize: 13, fontWeight: FontWeight.w700, color: Colors.deepPurple),
                        )
                      : Text(
                          controllerFoodCard.foodListDashBoard[index]['foodName_name'].substring(0, 12) +
                              "...",
                          style: GoogleFonts.laila(
                              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.deepPurple),
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
                                controllerFoodCard.getDecrease(index, controllerFoodCard.arrayof[index]);
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
                      () => Text(controllerFoodCard.arrayof[index].toString()),
                    ),
                    GestureDetector(
                        onTap: () {
                          controllerFoodCard.getIncrease(index, controllerFoodCard.arrayof[index]);
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
                    '৳' + controllerFoodCard.foodListDashBoard[index]['price'].toString(),
                    style: GoogleFonts.laila(
                        fontSize: 21, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                  ),
                ),
              ],
            )
          ],
        ),
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
     if(value[0].isNotEmpty)

      widgets.add(
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Padding(
               padding: const EdgeInsets.only(
                   left: 00.0, top: 30),
               child: Text(
                 '$key',
                 style: GoogleFonts.laila(
                     fontSize: 30,
                     fontWeight: FontWeight.w500,
                     color:Colors.grey),
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
                     child:Obx(() =>  InkWell(
                       onTap: () {
                         print("clicked");
                         boolListForAttributeValuesButton[index] = !boolListForAttributeValuesButton[index];

                       },
                       child: Container(
                         // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                         // margin: EdgeInsets.all(3),

                         decoration: BoxDecoration(
                           color: boolListForAttributeValuesButton[index] ? Colors.deepPurpleAccent.withOpacity(0.2) : Colors.grey.withOpacity(0.1),
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
                         )
                       ),
                     )

                     )
                   );
                 },
               ),
             )

           ],
         ));
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:

      widgets,
    );
  }
}

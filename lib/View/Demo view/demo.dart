import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testhive/View/Demo%20view/demoController.dart';

class demoDartView extends StatelessWidget {
  const demoDartView({super.key});

  @override
  Widget build(BuildContext context) {
    final DemoController demoController = new DemoController();
    TextEditingController textEditingController = new TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 300,
              // alignment: ,
              // color: Colors.red,
                margin: EdgeInsets.only(top: 30),

              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 27,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(155, 230, 127, 161),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        topRight: Radius.circular(5.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "মেনু এড করুন ",
                        style: GoogleFonts.laila(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                      ),
                      border: Border.all(
                        color: Color.fromARGB(107, 230, 171, 190), // Specify border color here
                        width: 1.0, // Specify border width here
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    /// category name it will vanisehd after the save button is pressed !!!!
                        Container(
                          height: 50,

                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextFormField(
                            controller: textEditingController,
                            decoration: InputDecoration(
                              labelText: "ক্যাটাগরি নাম ",
                              labelStyle:  GoogleFonts.laila(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.grey),
                              // hintText: "ex: Burger",
                              filled: true,
                              fillColor: Colors.grey[100],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0), // Adjust border radius to make it sharper
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0), // Adjust border radius to make it sharper
                                borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0), // Adjust border width
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0), // Adjust border radius to make it sharper
                                borderSide: BorderSide(color: const Color.fromARGB(100, 230, 127, 161), width: 1.0),
                              ),

                            ),
                            keyboardType: TextInputType.name,
                            style:  GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [

                              InkWell(
                                onTap: () {
                                  // Add functionality for Cancel button
                                  textEditingController.clear();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(color: Colors.pink, width: 2.0), // Pink border
                                  ),
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Colors.pink, // Pink text color
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {
                                  // Add functionality for Save button
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Text(
                                    'Save',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        )
                ],
                    )
                  ),

                  //// Added category te add dish

                  for(int i=0;i<5;i++)
                    Container(
                      margin: EdgeInsets.only(top: 5,bottom: 5),
                      child: Column(
                        children: [
                          //tea
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color:Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                                border: Border.all(
                                  color: Color.fromARGB(107, 230, 171, 190), // Specify border color here
                                  width: 1.0, // Specify border width here
                                ),
                              ),
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      "Tea ",
                                      style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
                                    ),
                                  ),
                                ],
                              )
                          ),
                          //,Milk tea
                          Container(
                              constraints: BoxConstraints(
                                minHeight: 90, // Set the minimum height here
                              ),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color:Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5.0),
                                  bottomRight: Radius.circular(5.0),
                                ),
                                border: Border.all(
                                  color: Color.fromARGB(107, 230, 171, 190), // Specify border color here
                                  width: 1.0, // Specify border width here
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                  Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Milk Tea ",
                                          style: GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.pinkAccent),
                                        ),

                                        for(int i=0;i<3;i++)
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
                                                "Small ",
                                                style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
                                              ),
                                              Text(
                                                "৳40 ",
                                                style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
                                              ),
                                            ],
                                          )
                                      ],
                                    ),
                                  )
                                ],
                              )
                          ),
                            // item and price variation add korun
                          Container(
                              constraints: BoxConstraints(
                                minHeight: 140, // Set the minimum height here
                              ),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color:Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5.0),
                                  bottomRight: Radius.circular(5.0),
                                ),
                                border: Border.all(
                                  color: Color.fromARGB(107, 230, 171, 190), // Specify border color here
                                  width: 1.0, // Specify border width here
                                ),
                              ),
                              //item add korun
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // item add korun
                            Container(
                              margin: EdgeInsets.only(top: 10,bottom: 20),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left:15.0,bottom: 12),
                                        child: Text(
                                          "আইটেম এড করুন  ",
                                          style: GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.pinkAccent),
                                        ),
                                      ),
                                    ],
                                  ),
                                  //item nam
                                  Container(
                                    height: 54,

                                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                                    child: TextFormField(
                                      controller: textEditingController,
                                      decoration: InputDecoration(
                                        labelText: "আইটেম নাম ",
                                        labelStyle:  GoogleFonts.laila(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
                                        // hintText: "ex: Burger",
                                        filled: true,
                                        fillColor: Colors.grey[100],
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0), // Adjust border radius to make it sharper
                                          borderSide: BorderSide.none,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0), // Adjust border radius to make it sharper
                                          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0), // Adjust border width
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(5.0), // Adjust border radius to make it sharper
                                          borderSide: BorderSide(color: const Color.fromARGB(100, 230, 127, 161), width: 1.0),
                                        ),

                                      ),
                                      keyboardType: TextInputType.name,
                                      style:  GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                            ),
                                  // price variation add korun
                                  Container(
                                    margin: EdgeInsets.only(top: 10,bottom: 30),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left:15.0,bottom: 12),
                                              child: Text(
                                                "প্রাইস এবং ভ্যারিয়েশন এড করুন   ",
                                                style: GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.pinkAccent),
                                              ),
                                            ),
                                          ],
                                        ),
                                        //item nam
                                      Row(
                                        children: [
                                          Container(
                                            height: 54,
                                            width: 200,

                                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                                            child: TextFormField(
                                              controller: textEditingController,
                                              decoration: InputDecoration(
                                                labelText: "আইটেম নাম ",
                                                labelStyle:  GoogleFonts.laila(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
                                                // hintText: "ex: Burger",
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(5.0), // Adjust border radius to make it sharper
                                                  borderSide: BorderSide.none,
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(5.0), // Adjust border radius to make it sharper
                                                  borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0), // Adjust border width
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(5.0), // Adjust border radius to make it sharper
                                                  borderSide: BorderSide(color: const Color.fromARGB(100, 230, 127, 161), width: 1.0),
                                                ),

                                              ),
                                              keyboardType: TextInputType.name,
                                              style:  GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
                                            ),
                                          ),
                                          Container(
                                            height: 54,
                                            width: 80,
                                            child: TextFormField(
                                              controller: textEditingController,
                                              decoration: InputDecoration(
                                                labelText: " প্রাইস",
                                                labelStyle:  GoogleFonts.laila(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
                                                // hintText: "ex: Burger",
                                                filled: true,
                                                fillColor: Colors.grey[100],
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(5.0), // Adjust border radius to make it sharper
                                                  borderSide: BorderSide.none,
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(5.0), // Adjust border radius to make it sharper
                                                  borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0), // Adjust border width
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(5.0), // Adjust border radius to make it sharper
                                                  borderSide: BorderSide(color: const Color.fromARGB(100, 230, 127, 161), width: 1.0),
                                                ),

                                              ),
                                              keyboardType: TextInputType.number,
                                              style:  GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
                                            ),
                                          )
                                        ],
                                      )
                                      ],
                                    ),
                                  )

                                ],
                              )
                          ),

                          //dis add korun
                          Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color:Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5.0),
                                  bottomRight: Radius.circular(5.0),
                                ),
                                border: Border.all(
                                  color: Color.fromARGB(107, 230, 171, 190), // Specify border color here
                                  width: 1.0, // Specify border width here
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(onPressed: (){

                                  }, icon: Icon(
                                    Icons.add,
                                    color: Colors.pinkAccent,
                                    size: 25,
                                  )),
                                  InkWell(
                                    onTap: (){

                                      print("add dish");
                                    },
                                    child:  Text(
                                      "ডিস এড করুন ",
                                      style: GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.pinkAccent),
                                    ),
                                  )
                                ],
                              )
                          ),
                        ],
                      ),
                    )






                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}
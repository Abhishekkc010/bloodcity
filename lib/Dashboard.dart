import 'dart:convert';

import 'package:applicationtwo/AllDonor.dart';
import 'package:applicationtwo/Bloodgroup.dart';
import 'package:applicationtwo/Message.dart';
import 'package:applicationtwo/Profile.dart';
import 'package:applicationtwo/requestblood.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'Datamodel.dart';
import 'Drawer.dart';
import 'Notification.dart';
import 'View.dart';
import 'ip/ip_address.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  static String id = "dashboard_page";
  static var Post = TextEditingController();
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String url = "$ip/first/v1/Blog";
  postProduct() async {
    String Post = Dashboard.Post.value.text;


    DataModel postProduct = DataModel(
      Post: Post,

    );

    var response = await post(Uri.parse(url),
        body: json.encode(postProduct),
        headers: {'Content-Type': 'application/json'});
    print(response.statusCode);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.black
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 196, 41, 41),
          title: const Text('DASHBOARD'),
          centerTitle: true,
        ),
        drawer: const NavDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              // Text("Dashboard"),


              // Row(
              //   children: [
              //     // Container(
              //     //   height: 90,
              //     //   padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
              //
              //     //   child: Text("A+"),
              //
              //     // ),
              //
              //     Container(
              //         child: ClipOval(
              //       child: Material(
              //         color: Colors.orange, // button color
              //         child: InkWell(
              //           splashColor: Colors.green, // splash color
              //           onTap: () {}, // button pressed
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: <Widget>[
              //               Icon(Icons.call), // icon
              //               Text("Call"), // text
              //             ],
              //           ),
              //         ),
              //       ),
              //     )),
              //     Container(
              //       height: 90,
              //       padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
              //       decoration: const BoxDecoration(
              //           image: DecorationImage(
              //             image: AssetImage('Images/bloodrop.PNG'),
              //           )),
              //       child: Text("A-"),
              //     ),
              //     Container(
              //       height: 90,
              //       padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
              //       decoration: const BoxDecoration(
              //           image: DecorationImage(
              //         image: AssetImage('Images/bloodrop.PNG'),
              //       )),
              //       child: Text("B+"),
              //     ),
              //     Container(
              //       height: 90,
              //       padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
              //       decoration: const BoxDecoration(
              //           image: DecorationImage(
              //         image: AssetImage('Images/bloodrop.PNG'),
              //       )),
              //       child: Text("B-"),
              //     )
              //   ],
              // ),
              // Row(
              //   children: [
              //     Container(
              //       height: 90,
              //       padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
              //       decoration: const BoxDecoration(
              //           image: DecorationImage(
              //         image: AssetImage('Images/bloodrop.PNG'),
              //       )),
              //       child: Text("O+"),
              //     ),
              //     Container(
              //       height: 90,
              //       padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
              //       decoration: const BoxDecoration(
              //           image: DecorationImage(
              //         image: AssetImage('Images/bloodrop.PNG'),
              //       )),
              //       child: Text("O-"),
              //     ),
              //     Container(
              //       height: 90,
              //       padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
              //       decoration: const BoxDecoration(
              //           image: DecorationImage(
              //         image: AssetImage('Images/bloodrop.PNG'),
              //       )),
              //       child: Text("AB+"),
              //     ),
              //     Container(
              //       height: 90,
              //       padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
              //       decoration: const BoxDecoration(
              //           image: DecorationImage(
              //         image: AssetImage('Images/bloodrop.PNG'),
              //       )),
              //       child: Text("AB-"),
              //     )
              //   ],
              // ),
              Text("Events",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  )),
              SizedBox(
                height: 15,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                // Container(
                //     height: 90,
                //     padding: EdgeInsets.fromLTRB(20, 0, 20, 0),

                // decoration: const BoxDecoration(
                //     image: DecorationImage(
                //   image: AssetImage('Images/bloodrop.PNG'),
                // )),
                //     child: Text("All Donors")),
                //     IconButton(
                //   onPressed: () {},
                //   icon: const Icon(CupertinoIcons.bell),
                //   padding: EdgeInsets.zero,
                //   constraints: const BoxConstraints(),
                // ),

                SizedBox(
                  width: 75,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AllDonor.id);
                        },
                        icon: const Icon(
                          CupertinoIcons.person_3_fill,
                          size: 40,
                          color: Color(0xEAD56B6B),
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Text("All Donors")
                    ],
                  ),
                ),

                // Container(
                //     height: 90,
                //     padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                //     decoration: const BoxDecoration(
                //         image: DecorationImage(
                //       image: AssetImage('Images/bloodrop.PNG'),
                //     )),
                //     child: Text("View Request")),
                SizedBox(
                  width: 100,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, View.id);
                        },
                        icon: const Icon(
                          CupertinoIcons.doc_richtext,
                          size: 40,
                          color: Color(0xEAD56B6B),
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "View Request",
                      )
                    ],
                  ),
                ),

                SizedBox(
                  width: 75,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AddProduct.id);
                        },
                        icon: const Icon(
                          Icons.bloodtype,
                          size: 40,
                          color: Color(0xEAD56B6B),
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("    Request")
                    ],
                  ),
                ),

                // Container(
                //     height: 90,
                //     padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                //     decoration: const BoxDecoration(
                //         image: DecorationImage(
                //       image: AssetImage('Images/bloodrop.PNG'),
                //     )),
                //     child: Text("Request Blood")),
              ]),
              const SizedBox(
                height: 30,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                SizedBox(
                  width: 75,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, MessagePage.id);
                        },
                        icon: const Icon(
                          Icons.chat,
                          size: 40,
                          color: Color(0xEAD56B6B),
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      const Text("Chats")
                    ],
                  ),
                ),
                SizedBox(
                  width: 85,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Bloodgroup.id);
                        },
                        icon: const Icon(
                          CupertinoIcons.drop,
                          size: 40,
                          color: Color(0xEAD56B6B),
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      const Text("BloodGroups")
                    ],
                  ),
                ),
                SizedBox(
                  width: 75,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ProfileApp.id);
                        },
                        icon: const Icon(
                          CupertinoIcons.person,
                          size: 40,
                          color: Color(0xEAD56B6B),
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      const Text("Profile")
                    ],
                  ),
                ),
              ]),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Blog",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),

          Container(
            padding: const EdgeInsets.all(30.0),
            height:300,
                width:400,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(16.0),
              color: Color(0xEADCDADA),
            ),


              child: TextFormField(
                controller: Dashboard.Post,
                decoration: InputDecoration(hintText: 'Post'),
                textInputAction: TextInputAction.next,
              ),
          ),



               ElevatedButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF41AAB9),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        )),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 236, 18, 10),
                    ),
                  ),
                  onPressed: () {
                    postProduct();
                  },
                  child: const Text("Submit")),



            // child:Text(
            //   " Giving blood can reveal  potential health problems.Giving blood may lower your risk of suffering a heart attack.",
            //   style: TextStyle(
            //     fontWeight: FontWeight.normal,
            //     fontSize: 20,
            //   ),
            // ),

         ]

      )

          ),

        bottomNavigationBar: Container(
          // decoration: ,
          height: 67,
          child: BottomAppBar(
            color: Color.fromARGB(255, 243, 232, 232),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Dashboard.id);
                        },
                        icon: const Icon(CupertinoIcons.home),
                        color: Colors.black,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Text("Home")
                    ],
                  ),
                ),
                SizedBox(
                  width: 75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, View.id);
                        },
                        icon: const Icon(CupertinoIcons.doc_plaintext),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Text("View")
                    ],
                  ),
                ),
                SizedBox(
                  width: 75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // GestureDetector(onTap: (){}, child: Icon(CupertinoIcons.person),),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color(0xEAEA5454),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, View.id);
                          },
                          icon: const Icon(
                            CupertinoIcons.plus,
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.zero,
                          iconSize: 40,
                          constraints: const BoxConstraints(),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      // const Text("Sell")
                      // Text("Scan/Pay",)
                    ],
                  ),
                ),
                SizedBox(
                  width: 75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {Navigator.pushNamed(context, Notifications.id);},
                        icon: const Icon(CupertinoIcons.bell),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Text("Notification")
                    ],
                  ),
                ),
                SizedBox(
                  width: 75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ProfileApp.id);
                        },
                        icon: const Icon(CupertinoIcons.person),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Text("Account")
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

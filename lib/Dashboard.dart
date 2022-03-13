import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  static String id = "dashboard_page";
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 196, 41, 41),
          title: const Text('DASHBOARD'),
          centerTitle: true,
        ),
        drawer: const NavDrawer(),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 15,
            ),
            // Text("Dashboard"),
            SizedBox(
              height: 15,
            ),
            Text("BloodGroup"),
            Row(
              children: [
                Container(
                  height: 90,
                  padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('Images/bloodrop.PNG'),
                  )),
                  child: Text("A+"),
                ),
                Container(
                  height: 90,
                  padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('Images/bloodrop.PNG'),
                  )),
                  child: Text("A-"),
                ),
                Container(
                  height: 90,
                  padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('Images/bloodrop.PNG'),
                  )),
                  child: Text("B+"),
                ),
                Container(
                  height: 90,
                  padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('Images/bloodrop.PNG'),
                  )),
                  child: Text("B-"),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  height: 90,
                  padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('Images/bloodrop.PNG'),
                  )),
                  child: Text("O+"),
                ),
                Container(
                  height: 90,
                  padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('Images/bloodrop.PNG'),
                  )),
                  child: Text("O-"),
                ),
                Container(
                  height: 90,
                  padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('Images/bloodrop.PNG'),
                  )),
                  child: Text("AB+"),
                ),
                Container(
                  height: 90,
                  padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('Images/bloodrop.PNG'),
                  )),
                  child: Text("AB-"),
                )
              ],
            ),
            Text("Events"),
            SizedBox(
              height: 15,
            ),
            Row(children: [
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.person_3_fill),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(
                      height: 5.0,
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
                width: 75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.doc_richtext),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text("View Request")
                  ],
                ),
              ),

              SizedBox(
                width: 75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.drop),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text("Request")
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
            Row(children: [
              // Container(
              //     height: 90,
              //     padding: EdgeInsets.fromLTRB(35, 0, 20, 0),
              //     decoration: const BoxDecoration(
              //         image: DecorationImage(
              //       image: AssetImage('Images/bloodrop.PNG'),
              //     )),
              //     child: Text("Chats")),
              // Container(
              //     height: 90,
              //     padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              //     decoration: const BoxDecoration(
              //         image: DecorationImage(
              //       image: AssetImage('Images/bloodrop.PNG'),
              //     )),
              //     child: Text("Profile")),
              SizedBox(
                width: 75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.bell_circle),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text("Chats")
                  ],
                ),
              ),
              SizedBox(
                width: 75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.person),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text("Profile")
                  ],
                ),
              ),
            ]),
            Text("Blog"),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Blogs.s.s.s.s.s..ss"),
            ),
          ]),
        ));
  }
}

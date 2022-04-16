import 'package:flutter/material.dart';

import 'Drawer.dart';

class Bloodgroup extends StatefulWidget {
  const Bloodgroup({Key? key}) : super(key: key);
  static String id = "Bloodgrop_page";
  @override
  State<Bloodgroup> createState() => _BloodgroupState();
}

class _BloodgroupState extends State<Bloodgroup> {
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
                child: Column(children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  // Container(
                  //   height: 90,
                  //   padding: EdgeInsets.fromLTRB(35, 0, 35, 0),

                  //   child: Text("A+"),

                  // ),

                  Container(
                      child: ClipOval(
                    child: Material(
                      color: Colors.orange, // button color
                      child: InkWell(
                        splashColor: Colors.green, // splash color
                        onTap: () {}, // button pressed
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.call), // icon
                            Text("Call"), // text
                          ],
                        ),
                      ),
                    ),
                  )),
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
            ]))));
  }
}

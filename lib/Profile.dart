import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: ProfileApp(),
    ));

class ProfileApp extends StatefulWidget {
  const ProfileApp({Key? key}) : super(key: key);
  static String id = "Profile page";

  @override
  State<ProfileApp> createState() => _ProfileAppState();
}

class _ProfileAppState extends State<ProfileApp> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
      Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromARGB(255, 168, 18, 18),
                Color.fromARGB(255, 173, 21, 21)
              ])),
          child: Container(
            width: double.infinity,
            height: 350.0,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1547721064-da6cfb341d50",
                    ),
                    radius: 50.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "ABHISHEK KC",
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 22.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "BloodType",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 173, 37, 37),
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "A+",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.redAccent,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Donated",
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "28.5K",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.pinkAccent,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Requested",
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "1300",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pinkAccent,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
      SizedBox(
        height: 7,
      ),
      Text(
        'PERSONAL INFORMATION',
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),

      SizedBox(
        height: 10,
      ),
      Container(
        height: 60,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'PHONE NUMBER',
              style: TextStyle(color: Color.fromARGB(179, 15, 6, 6)),
            ),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(
                width: 1.0, color: Color.fromARGB(179, 238, 43, 43))),
      ),
      SizedBox(
        height: 7,
      ),
      Container(
        height: 60,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'DATEOFBIRTH',
              style: TextStyle(color: Color.fromARGB(179, 15, 6, 6)),
            ),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(
                width: 1.0, color: Color.fromARGB(179, 231, 77, 77))),
      ),
      SizedBox(
        height: 7,
      ),
      Container(
        height: 60,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'EMAIL',
              style: TextStyle(color: Color.fromARGB(179, 15, 6, 6)),
            ),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(
                width: 1.0, color: Color.fromARGB(179, 231, 77, 77))),
      ),
      SizedBox(
        height: 7,
      ),
      Container(
        height: 60,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'PASSWORD',
              style: TextStyle(color: Color.fromARGB(179, 15, 6, 6)),
            ),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(
                width: 1.0, color: Color.fromARGB(179, 231, 77, 77))),
      ),
      SizedBox(
        height: 7,
      ),
      Container(
        height: 60,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'PROVINCE',
              style: TextStyle(color: Color.fromARGB(179, 15, 6, 6)),
            ),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(
                width: 1.0, color: Color.fromARGB(179, 231, 77, 77))),
      ),
      SizedBox(
        height: 7,
      ),
      Container(
        height: 60,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'DISTRICT',
              style: TextStyle(color: Color.fromARGB(179, 15, 6, 6)),
            ),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(
                width: 1.0, color: Color.fromARGB(179, 231, 77, 77))),
      ),
      SizedBox(
        height: 7,
      ),
      Container(
        height: 60,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'CITY',
              style: TextStyle(color: Color.fromARGB(179, 15, 6, 6)),
            ),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(
                width: 1.0, color: Color.fromARGB(179, 231, 77, 77))),
      ),
      SizedBox(
        height: 7,
      ),
      Container(
        height: 60,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'GENDER',
              style: TextStyle(color: Color.fromARGB(179, 15, 6, 6)),
            ),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(
                width: 1.0, color: Color.fromARGB(179, 231, 77, 77))),
      ),
      // Container(
      //   child: Padding(
      //     padding:
      //         const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: const <Widget>[
      //         Text(
      //           "Name:",
      //           style: TextStyle(
      //               color: Colors.redAccent,
      //               fontStyle: FontStyle.normal,
      //               fontSize: 28.0),
      //         ),
      //         SizedBox(
      //           height: 30.0,
      //         ),
      //         Text(
      //           "EMAIL:",
      //           style: TextStyle(
      //               color: Colors.redAccent,
      //               fontStyle: FontStyle.normal,
      //               fontSize: 28.0),
      //         ),
      //         Text(
      //           "DATEOFBIRTH:",
      //           style: TextStyle(
      //               color: Colors.redAccent,
      //               fontStyle: FontStyle.normal,
      //               fontSize: 28.0),
      //         ),
      //         Text(
      //           "PROVINCE:",
      //           style: TextStyle(
      //               color: Colors.redAccent,
      //               fontStyle: FontStyle.normal,
      //               fontSize: 28.0),
      //         ),
      //         Text(
      //           "DISTRICT:",
      //           style: TextStyle(
      //               color: Colors.redAccent,
      //               fontStyle: FontStyle.normal,
      //               fontSize: 28.0),
      //         ),
      //         Text(
      //           "CITY:",
      //           style: TextStyle(
      //               color: Colors.redAccent,
      //               fontStyle: FontStyle.normal,
      //               fontSize: 28.0),
      //         ),
      //         Text(
      //           "CITY:",
      //           style: TextStyle(
      //               color: Colors.redAccent,
      //               fontStyle: FontStyle.normal,
      //               fontSize: 28.0),
      //         ),
      //         Text(
      //           "GENDER:",
      //           style: TextStyle(
      //               color: Colors.redAccent,
      //               fontStyle: FontStyle.normal,
      //               fontSize: 28.0),
      //         ),
      //         SizedBox(
      //           height: 10.0,
      //         ),
      //         Text(
      //           'My name is Abhishek and I am  a freelance mobile app developper.\n'
      //           'Help ME',
      //           style: TextStyle(
      //             fontSize: 22.0,
      //             fontStyle: FontStyle.italic,
      //             fontWeight: FontWeight.w300,
      //             color: Colors.black,
      //             letterSpacing: 2.0,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),

      SizedBox(
        height: 20.0,
      ),
      Container(
          width: 300.00,
          child: RaisedButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0)),
            elevation: 0.0,
            padding: EdgeInsets.all(0.0),
            // child: Ink(
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //         begin: Alignment.centerRight,
            //         end: Alignment.centerLeft,
            //         colors: [Colors.redAccent, Colors.pinkAccent]),
            //     borderRadius: BorderRadius.circular(30.0),
            //   ),
            //   child: Container(
            //     constraints:
            //         BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            //     alignment: Alignment.center,
            //     child: Text(
            //       "Contact me",
            //       style: TextStyle(
            //           color: Colors.white,
            //           fontSize: 26.0,
            //           fontWeight: FontWeight.w300),
            //     ),
            //   ),
            // )
            child: Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  print(isSwitched);
                });
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
            ),
          ))
    ])));
  }
}

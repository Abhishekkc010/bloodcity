import 'dart:convert';

import 'package:applicationtwo/Bloodgroup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'Dashboard.dart';
import 'Datamodel.dart';
import 'DetailsView.dart';
import 'Drawer.dart';
import 'Notification.dart';
import 'Profile.dart';
import 'Search.dart';
import 'ip/ip_address.dart';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);
  static String id = "View_page";

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  String url ="$ip/first/v1/view";

      // "http://100.64.240.46:8000/first/v1/view";
  // String deleteUrl="http://100.64.240.46:8000/first/v1/request";
  // String?deleteId;
  // "http://10.0.2.2:8000/first/v1/view"
  Future<List<DataModel>> _getDataList() async {
    Response response = await get(
      Uri.parse(url),
    );
    var responseData = jsonDecode(response.body);
    print(responseData);
    List<DataModel> DataDetails = [];
    for (var i in responseData) {
      DataModel datas = DataModel(
          BloodType: i['BloodType'],
          Name: i['Name'],
          id: i['id'],
          City: i['City'],
          State: i['State']
      );

      DataDetails.add(datas);
      print(DataDetails);
    }

    return DataDetails;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFCCCCC),
        appBar: AppBar(
          backgroundColor: const Color(0xFFE52222),
          title: const Text('View Request'),
      actions: [
        IconButton(onPressed: (){
          showSearch(context: context, delegate: SearchUser());
        }, icon: Icon(CupertinoIcons.search_circle_fill ,  size: 38,))
      ],  ),
        drawer: const NavDrawer(),
        body: FutureBuilder(
            future: _getDataList(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(
                    child: Text(
                  "No Data Found...",
                  style: TextStyle(color: Colors.black),
                ));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          height: 150,
                          child: GestureDetector(
                            child: Container(
                              width: 300,
                                height: 100,
                      // decoration: BoxDecoration(
                      // gradient: LinearGradient(
                      // colors: [Colors.orangeAccent, Colors.deepOrange.shade300],
                      // begin: Alignment.centerLeft,
                      // end: Alignment.centerRight,
                      // stops: [0.5, 0.9],
                      // ),
                      // ),




                      child: Card(

                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45.0),

                      ),
                      // color: Color(0xEAFFFFFF).withOpacity(0.2),
                        color: Color(0xEAFFFFFF),
                            elevation: 25,

                            // Card(
                            //   shadowColor: Colors.black,
                            //   shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(20.0)),
                            //   elevation: 10,
                            //   color: const Color(0xFFF1F1F1),
                              child: Center(
                                child: ListTile(
                                  leading: Text(
                                   'Bloodgroup \n' '${snapshot.data[index].BloodType}',
                                    style: TextStyle(
                                      fontSize: 25,
                                      foreground: Paint()
                                        ..style = PaintingStyle.fill
                                        // ..style = PaintingStyle.fill
                                        ..strokeWidth = 6
                                        ..color = Color.fromARGB(255, 134, 16, 16),
                                    ),
                                  ),


                                  title: Text(
                                    'Name: '
                                        '${snapshot.data[index].Name}',
                                    style: const TextStyle(
                                        color: Color(0xFF003049),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),

                                  // trailing: IconButton(
                                  //     icon: Icon(Icons.delete, color: Colors.red),
                                  //     onPressed: () {
                                  //       // deleteId = snapshot.data[index].id;
                                  //       // deleteProduct();
                                  //     }),


                                  subtitle: Text(
                                    'City: ${snapshot.data[index].City}',
                                    style: const TextStyle(
                                        color: Color(0xFF003049),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),

                                ),
                              ),
                            ),
                            ),

                            onTap: () {
                              int pId = snapshot.data[index].id;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailProduct(
                                            id: pId,
                                          )
                                  )
                              );
                              // print (pid);
                            },
                          ),
                        ),
                      );
                    });
              }
            }),

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

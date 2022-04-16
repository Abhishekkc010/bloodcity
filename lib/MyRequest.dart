import 'dart:convert';

import 'package:applicationtwo/ip/ip_address.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'Datamodel.dart';
import 'Drawer.dart';

class Myrequest extends StatefulWidget {
  const Myrequest({Key? key}) : super(key: key);
  static String id = "Myrequest_page";

  @override
  State<Myrequest> createState() => _MyrequestState();
}

class _MyrequestState extends State<Myrequest> {
  String deleteUrl ="$ip/first/v1/request";
      // "http://100.64.240.46:8000/first/v1/request";
  // String hello ="/$ip/first/v1/request";
  String? deleteId;
  Future<List<DataModel>> _getDataList() async {
    Response response = await get(
      Uri.parse(deleteUrl),
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
          State: i['State'],
          UserID:i['UserID']);

      DataDetails.add(datas);
      print(DataDetails);
    }

    return DataDetails;
  }

  Future<Response> deleteProduct() async {
    Response response = await delete(
      Uri.parse('$deleteUrl/$deleteId/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 204) {
      const snackBar = SnackBar(content: Text('The Product has been deleted!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      const snackBar =
          SnackBar(content: Text('The Product could not be deleted!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    return response;
  }

  @override
  Widget build(BuildContext context) {
   return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xEAE7E6E6),
        appBar: AppBar(
          backgroundColor: const Color(0xFFC62828),
          title: const Text('MY Request'),
        ),
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
                      if('${snapshot.data[index].UserID}'==
                      FirebaseAuth.instance.currentUser!.uid)
                      {
                        return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SizedBox(
                          height: 150,
                          child: GestureDetector(
                            child: Container(
                              width: 300,
                              height: 100,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                // color: Color(0xEAFFFFFF).withOpacity(0.2),
                                color: Color(0xEAFFFFFF),

                                // Card(
                                //   shadowColor: Colors.black,
                                //   shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(20.0)),
                                //   elevation: 10,
                                //   color: const Color(0xFFF1F1F1),
                                child: Center(
                                  child: ListTile(
                                    leading: Text(
                                      'Bloodgroup \n'
                                          '${snapshot.data[index].BloodType}',
                                      style: TextStyle(
                                        fontSize: 25,
                                        foreground: Paint()
                                          ..style = PaintingStyle.fill
                                        // ..style = PaintingStyle.fill
                                          ..strokeWidth = 6
                                          ..color =
                                          Color.fromARGB(255, 134, 16, 16),
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
                                    trailing: IconButton(
                                        icon: Icon(Icons.delete,
                                            color: Colors.red),
                                        onPressed: () {
                                          deleteId = snapshot.data[index].id.toString();
                                          deleteProduct();

                                        }),
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

                            // onTap: () {
                            //   int pId = snapshot.data[index].id;
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => DetailProduct(
                            //             id: pId,
                            //           )
                            //       )
                            //   );
                            //   // print (pid);
                            // },
                          ),
                        ),
                      );}
                      return Padding(padding: EdgeInsets.all(5),);

                    }
                    );
              }
            }),
      ),
    );
  }
}

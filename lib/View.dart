import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'Datamodel.dart';
import 'DetailsView.dart';
import 'Drawer.dart';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);
  static String id = "View_page";

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  String url = "http://10.0.2.2:8000/first/v1/view";
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
        backgroundColor: Color.fromARGB(255, 150, 17, 17),
        appBar: AppBar(
          backgroundColor: Color(0xFFC62828),
          title: const Text('View Request'),
        ),
        drawer: const NavDrawer(),
        body: FutureBuilder(
            future: _getDataList(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(
                    child: Text(
                  "Loading...",
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
                            child: Card(
                              shadowColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              elevation: 10,
                              color: const Color(0xFFF1F1F1),
                              child: Center(
                                child: ListTile(
                                  leading: Text(
                                    'BloodType: ${snapshot.data[index].BloodType}',
                                    style: const TextStyle(
                                        color: Color(0xFF003049),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  title: Text(
                                    'Name: ${snapshot.data[index].Name}',
                                    style: const TextStyle(
                                        color: Color(0xFF003049),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  subtitle: Text(
                                    'id: ${snapshot.data[index].id}',
                                    style: const TextStyle(
                                        color: Color(0xFF003049),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
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
                                          )));
                              // print (pid);
                            },
                          ),
                        ),
                      );
                    });
              }
            }),
      ),
    );
  }
}

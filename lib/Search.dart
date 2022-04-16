import 'dart:convert';

import 'package:applicationtwo/Datamodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'ip/ip_address.dart';



class SearchUser extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<DataModel>>(
      future: getProductList(query: query),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.data == null) {
          return const Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(),
              ));
        } else {
          if (noData == false) {
            return Column(
              children: [
                Flexible(
                  child: GridView.builder(
                    itemCount: snapshot.data.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => View(
                            //           id: snapshot.data[index].id,
                            //         )));
                          },
                          child: Container(
                            // decoration: kProductFieldStyle,
                            child: Column(children: [
                              const SizedBox(
                                height: 15,
                              ),
                              // Container(
                              //   color: Colors.white,
                              //   height: 120,
                              //   width: 120,
                              //   child: Image.network(
                              //     '${snapshot.data[index].BloodType}',
                              //   ),
                              // ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                '${snapshot.data[index].Name}',
                                // style: kProductTextHomeStyle,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Address/City: ${snapshot.data[index].City}',
                              ),
                            ]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Sorry'),
                  Text('No Data found !'),
                ],
              ),
            );
          }
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text ('Search BloodType by their ', style: TextStyle(fontSize: 16),),
          SizedBox(height: 5,),
          Text ('Full Name', style: TextStyle(fontSize: 16),)
        ],
      ),
    );
  }

  bool noData=false;
  String get url => "$ip/first/v1/view";
  Future<List<DataModel>> getProductList({String? query}) async {
    Response response = await get(
      Uri.parse(url),
    );
    List<DataModel> productDetails = [];
    // print(productResponseData);

    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var i in data) {
          DataModel products = DataModel(
            id: i['id'],
            Name: i['Name'],
            BloodType: i['BloodType'],
            City: i['City'],
            State: i['State'],
          );

          // print(productDetails);
          if (query != null) {
            if (products.Name!.toLowerCase().contains(query.toLowerCase()) ||
                products.BloodType!.toLowerCase().contains(query.toLowerCase())
            ){
              productDetails.add(products);
            }
          }

        }
      } else {
        print('api error');
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    if(productDetails.isEmpty){
      noData = true;
    }
    return productDetails;
  }
}
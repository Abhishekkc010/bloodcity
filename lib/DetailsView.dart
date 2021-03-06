import 'dart:convert';

import 'package:applicationtwo/Datamodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DetailProduct extends StatefulWidget {
  final int id;
  const DetailProduct({required this.id});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  String url = "http://10.0.2.2:8000/first/v1";
  int? Id;
  String? Name;
  String? BloodType;
  String? City;
  String? State;
  bool isWaiting = true;
  Future<List<DataModel>> _getSpecificProductList() async {
    isWaiting = false;
    Response response = await get(
      Uri.parse('$url/${widget.id}'),
    );
    var productResponseData = jsonDecode(response.body);
    //print(response.statusCode);
    print(productResponseData);
    List<DataModel> productDetails = [];
    // for (var i in productResponseData) {
    DataModel products = DataModel(
      id: productResponseData['id'],
      Name: productResponseData['Name'],
      BloodType: productResponseData['BloodType'],
      City: productResponseData['City'],
      State: productResponseData['State'],
    );
    setState(() {
      Id = productResponseData['id'];
      Name = productResponseData['Name'];
      BloodType = productResponseData['BloodType'];
      City = productResponseData['City'];
      State = productResponseData['State'];
    });

    productDetails.add(products);
    // print(productDetails);
    // }

    return productDetails;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSpecificProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(251, 216, 23, 23),
        title: const Text('Detail View'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: 500,
            width: double.infinity,
            color: Color.fromARGB(255, 238, 243, 245),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.id.toString(),
                  ),
                  Text(
                    isWaiting ? '?' : 'Name: ${Name.toString()}',
                  ),
                  Text(
                    isWaiting ? '?' : 'BloodType: ${BloodType.toString()}',
                  ),
                  Text(
                    isWaiting ? '?' : 'City: ${City.toString()}',
                  ),
                  Text(
                    isWaiting ? '?' : 'State: ${State.toString()}',
                  ),

                  // Expanded(
                  //     child: Image(
                  //         image: NetworkImage(isWaiting
                  //             ? 'https://picsum.photos/250?image=9'
                  //             : disImage.toString()))),
                  ElevatedButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 233, 56, 56),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        )),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 233, 56, 56),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Request'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

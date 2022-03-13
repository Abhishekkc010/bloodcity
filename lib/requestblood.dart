import 'dart:convert';

import 'package:applicationtwo/Dashboard.dart';
import 'package:applicationtwo/Login.dart';
import 'package:applicationtwo/View.dart';
import 'package:applicationtwo/verify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'Datamodel.dart';
import 'Drawer.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);
  static String id = "addproduct_page";
  static var Name = TextEditingController();
  static var Phone = TextEditingController();
  static var BloodType = TextEditingController();
  static var State = TextEditingController();
  static var District = TextEditingController();
  static var City = TextEditingController();
  static var RequiredUnit = TextEditingController();
  static var RequiredDate = TextEditingController();
  static var HospitalName = TextEditingController();
  static var DetailAboutCase = TextEditingController();
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String url = "http://10.0.2.2:8000/first/v1/request";
  addProduct() async {
    String Name = AddProduct.Name.value.text;
    String Phone = AddProduct.Phone.value.text;
    String BloodType = AddProduct.BloodType.value.text;
    String State = AddProduct.State.value.text;
    String District = AddProduct.District.value.text;
    String City = AddProduct.City.value.text;
    String RequiredUnit = AddProduct.RequiredUnit.value.text;
    String RequiredDate = AddProduct.RequiredDate.value.text;
    String HospitalName = AddProduct.HospitalName.value.text;
    String DetailAboutCase = AddProduct.DetailAboutCase.value.text;

    DataModel postProduct = DataModel(
        Name: Name,
        Phone: Phone,
        BloodType: BloodType,
        State: State,
        District: District,
        City: City,
        RequiredDate: RequiredDate,
        RequiredUnit: RequiredUnit,
        HospitalName: HospitalName,
        DetailAboutCase: DetailAboutCase);

    var response = await post(Uri.parse(url),
        body: json.encode(postProduct),
        headers: {'Content-Type': 'application/json'});
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFDCF3F9),
        appBar: AppBar(
          backgroundColor: Color(0xFFC62828),
          title: const Text('Request Blood'),
        ),
        drawer: const NavDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextFormField(
                  controller: AddProduct.Name,
                  decoration: InputDecoration(hintText: 'Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextFormField(
                  controller: AddProduct.BloodType,
                  decoration: InputDecoration(hintText: 'BloodType'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextFormField(
                  controller: AddProduct.Phone,
                  decoration: InputDecoration(hintText: 'Phone'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextFormField(
                  controller: AddProduct.State,
                  decoration: InputDecoration(hintText: 'State'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextFormField(
                  controller: AddProduct.District,
                  decoration: InputDecoration(hintText: 'District'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextFormField(
                  controller: AddProduct.City,
                  decoration: InputDecoration(hintText: 'City'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextFormField(
                  controller: AddProduct.City,
                  decoration: InputDecoration(hintText: 'City'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextFormField(
                  controller: AddProduct.RequiredUnit,
                  decoration: InputDecoration(hintText: 'RequiredBloodUnit'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextFormField(
                  controller: AddProduct.RequiredDate,
                  decoration: InputDecoration(hintText: 'RequiredDate'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextFormField(
                  controller: AddProduct.HospitalName,
                  decoration: InputDecoration(hintText: 'HospitalName'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextFormField(
                  controller: AddProduct.DetailAboutCase,
                  decoration: InputDecoration(hintText: 'DetailAboutCase'),
                ),
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF41AAB9),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      )),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF41AAB9),
                      ),
                    ),
                    onPressed: () {
                      addProduct();
                    },
                    child: const Text("Submit")),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
            height: 67,
            child: BottomAppBar(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.home),
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
                          Navigator.pushNamed(context, Dashboard.id);
                        },
                        icon: const Icon(CupertinoIcons.doc_plaintext),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Text("Statements")
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
                          color: const Color(0xFF292b2b),
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
                        onPressed: () {},
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
                          Navigator.pushNamed(context, '/account');
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
            ))));
  }
}

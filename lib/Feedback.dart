import 'package:flutter/material.dart';
import 'Drawer.dart';

class feedback extends StatefulWidget {
  const feedback({Key? key}) : super(key: key);
  static String id = "feedback_page";

  @override
  State<feedback> createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  get isTypeSelected => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 2.0,
            centerTitle: true,
            title: Text(
              "Feedback",
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
          ),
        )
    );
  }}


import 'package:flutter/material.dart';

import 'Login.dart';
import 'register.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static String id = "home page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF3EDED),
        appBar: AppBar(
          backgroundColor: const Color(0xFFC62828),
          title: const Text('My Application'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(children: [
            Container(
              height: 400,
              padding: const EdgeInsets.only(
                  left: 43, top: 72, right: 43, bottom: 80),
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(

                image: AssetImage('Images/bloodcity.png'),
                    scale: 0.5,
                    // fit: BoxFit.fitHeight,
              )),
            ),
            // Container(
            //     height: 60,
            //     color: Colors.white,
            //     padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
            //     child: Column(children: [
            //       RaisedButton(
            //         textColor: Colors.black,
            //         color: Color(0xFFC66868),
            //         child: Text('Login'),
            //         onPressed: () {
            //           Navigator.pushNamed(context, Login.id);
            //         },
            //       )
            //     ])),
            ElevatedButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 19, 27, 29),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 209, 91, 91)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, Login.id);
                },
                child: const Text("LOGIN")),
            ElevatedButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 19, 27, 29),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 209, 91, 91),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, Registration.id);
                },
                child: const Text("REGISTER")),
            // Container(
            //     height: 90,
            //     padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            //     child: Column(children: [
            //       RaisedButton(
            //           textColor: Colors.black,
            //           color: Color(0xFFC66868),
            //           child: Text('Register'),
            //           onPressed: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (Context) => Registration()));
            //           })
            //     ])),
            const SizedBox(
              height: 70,
            ),
            Text(
              "Live An Effective Life, Not A Long Life",
              style: new TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 8, 1, 1),
              ),
            ),
          ])),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Text("Help"),
          backgroundColor: Colors.black,
          onPressed: () {},
        ));
  }
}

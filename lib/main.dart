import 'package:applicationtwo/Loginfacebook.dart';
import 'package:applicationtwo/Profile.dart';
import 'package:applicationtwo/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Dashboard.dart';
import 'HomeScreen.dart';
import 'Login.dart';
import 'View.dart';
import 'requestblood.dart';
import 'verify.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Home.id,
      routes: {
        Login.id: (context) => const Login(),
        Home.id: (context) => const Home(),
        VerifyEmail.id: (context) => const VerifyEmail(),
        Dashboard.id: (context) => const Dashboard(),
        AddProduct.id: (context) => const AddProduct(),
        View.id: (context) => const View(),
        ProfileApp.id: (context) => ProfileApp(),
        Registration.id: (context) => const Registration(),
      },
    );
  }
}

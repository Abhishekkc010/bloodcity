import 'package:applicationtwo/AllDonor.dart';
import 'package:applicationtwo/Bloodgroup.dart';
import 'package:applicationtwo/Feedback.dart';
import 'package:applicationtwo/Loginfacebook.dart';
import 'package:applicationtwo/Message.dart';
import 'package:applicationtwo/MyRequest.dart';
import 'package:applicationtwo/Profile.dart';
import 'package:applicationtwo/Rating.dart';
import 'package:applicationtwo/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Dashboard.dart';
import 'HomeScreen.dart';
import 'Login.dart';
import 'View.dart';
import 'chat_page.dart';
import 'requestblood.dart';
import 'verify.dart';
import 'Notification.dart';

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
      theme: ThemeData(primarySwatch: Colors.red),
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
        MessagePage.id: (context) => const MessagePage(),
        AllDonor.id: (context) => const AllDonor(),
        Bloodgroup.id: (context) => const Bloodgroup(),
        feedback.id: (context) => const feedback(),
        Myrequest.id:(context) => const Myrequest(),
        Rating.id:(context) =>  const Rating(),
        Chats.id: (context) => const Chats(),
        Notifications.id: (context) => const Notifications(),

      },
    );
  }
}

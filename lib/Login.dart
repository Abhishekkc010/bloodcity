import 'package:applicationtwo/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'requestblood.dart';
import 'verify.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static var emailController = TextEditingController();
  static var passwordController = TextEditingController();
  static String id = "login page";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final auth = FirebaseAuth.instance;
  late User user;
  final formKey = GlobalKey<FormState>();

  void validate() {
    if (formKey.currentState!.validate()) {
      login();
      // Navigator.pushNamed(context, OTPVerification.id);
    } else {
      final snackBar = SnackBar(content: Text('Please! fill all the field.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  login() async {
    try {
      await auth.signInWithEmailAndPassword(
          email: Login.emailController.text,
          password: Login.passwordController.text);
      user = auth.currentUser!;
      await user.reload();
      if (user.emailVerified) {
        Navigator.pushNamed(context, Dashboard.id);
      } else {
        Navigator.pushNamed(context, VerifyEmail.id);
      }
    } on FirebaseAuthException catch (e) {
      final snackMessage = SnackBar(content: Text(e.message.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 253, 253),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 207, 22, 22),
        title: const Text('My Application'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 155,
            padding:
                const EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 15),
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('Images/BloodDonation.png'),
              // fit: BoxFit.contain,
              scale: 0.5,
              // fit: BoxFit.fill,
            )),
          ),
          Text(
            "Sign in"
            " to BloodCity",
            textAlign: TextAlign.left,
          ),
          Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 9),
                    // padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: Login.emailController,
                      validator: MultiValidator([
                        RequiredValidator(errorText: 'Required *'),
                        EmailValidator(errorText: 'Invalid Email')
                      ]),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF1F1F1F),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Arial'),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email/Username',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: Login.passwordController,
                      validator: MultiValidator(
                        [
                          RequiredValidator(errorText: 'Required *'),
                          MinLengthValidator(6,
                              errorText: 'Minimum 6 characters'),
                          MaxLengthValidator(15,
                              errorText: 'Maximum 15 characters'),
                        ],
                      ),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ],
              )),
          ElevatedButton(
            onPressed: () {
              validate();
            },
            child: Text('Login'),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
              Color.fromARGB(255, 207, 22, 22),
            )),
          ),
        ],
      ),
    );
  }
}

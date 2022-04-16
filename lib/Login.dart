import 'package:applicationtwo/Dashboard.dart';
import 'package:applicationtwo/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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

  bool value = false;
  Map? _userData;
  String provider = '';
  facebookSignIn() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      provider = 'facebook';
      final userData = await FacebookAuth.i.getUserData(
        fields: "email,name,id",
      );
      setState(() {
        _userData = userData;
      });
      print(_userData);
      print(provider);
      //Navigator.pushNamed(context, GoogleMapScreen.id);
      Navigator.pushNamed(context, Dashboard.id);
    } else {
      print('login unsuccessful');
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
      body: SingleChildScrollView(
        child: Column(
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
                scale: 1.5,
                // fit: BoxFit.fill,
              )),
            ),

            SizedBox(height: 15,),

            Padding(
              padding: EdgeInsets.only(right: 210),
              child: const Text('Welcome\nTo BloodCity ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,color:  Colors.black,
                  // Color.fromARGB(255, 245, 6, 6),
                    fontSize: 32,
                  )),
            ),

            SizedBox(height: 40,),

            const Text('Email', textAlign: TextAlign.right,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black87,

                  fontSize: 18,
                )),

            // const Text(
            //   "Sign in"
            //   " to BloodCity",
            //   textAlign: TextAlign.left,
            // ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45,vertical: 0),
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
                        // decoration: InputDecoration(
                        //   border: OutlineInputBorder(),
                        //   hintText: 'Email/Username',
                        // ),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:Color(0xFF0A0202),
                                  width: 2,
                                )
                            )
                        ),
                          textInputAction: TextInputAction.next,
                      ),

                    ),
                    // Padding(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    // child: TextFormField(
                    //   controller: ,
                    //   decoration: const InputDecoration(
                    //     enabledBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(
                    //         color:Color(0xFF333F44),
                    //         width: 3,
                    //       )
                    //     )
                    //   ),
                    //
                    // ),),

                    SizedBox(height: 35,),


                    const Text('Password', textAlign: TextAlign.right,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          // fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 18,
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 0),
                      child: TextFormField(
                        obscureText: true,
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
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:Color(0xFF0A0101),
                                  width: 2,
                                )
                            )
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 35,),

            ElevatedButton(
              onPressed: () {
                validate();
                //facebookSignIn();
              },
              child: Text('Login'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                Color.fromARGB(255, 207, 22, 22),
              )),
            ),
            ElevatedButton(
              onPressed: () {
                facebookSignIn();
              },
              child: Text('LOGIN with Facebook'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                Color.fromARGB(255, 45, 104, 182),
              )),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(28, 25, 24, 25),
              // padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  GestureDetector(
                    child: Text("Register Now",style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                    ),

                    ), onTap: () {
                    Navigator.pushNamed(context, Registration.id);
                  },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

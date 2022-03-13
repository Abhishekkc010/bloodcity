import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'verify.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);
  static String id = "registration_page";
  static var fullname = TextEditingController();
  static var contactno = TextEditingController();
  static var email = TextEditingController();
  static var newpassword = TextEditingController();
  static var confirmpassword = TextEditingController();

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;

  void validate() {
    if (formKey.currentState!.validate()) {
      register();
    } else {
      const snackBar = SnackBar(content: Text('Please! fill all the field.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  register() async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: Registration.email.text,
          password: Registration.confirmpassword.text);
      await Navigator.pushNamed(context, VerifyEmail.id);
    } on FirebaseAuthException catch (e) {
      final snackMessage = SnackBar(content: Text(e.message.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF3EDED),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 28, horizontal: 43),
                    child: Container(
                      height: 240,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('Images/bloodcity.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 50, 24, 0),
                          child: TextFormField(
                            controller: Registration.fullname,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              hintText: 'Full name',
                            ),
                            validator:
                                RequiredValidator(errorText: 'Required *'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: Registration.contactno,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              hintText: 'Contact no.',
                            ),
                            validator:
                                RequiredValidator(errorText: 'Required *'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                          child: TextFormField(
                            controller: Registration.email,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textAlign: TextAlign.left,
                            decoration:
                                InputDecoration(hintText: 'Email address'),
                            validator: MultiValidator([
                              RequiredValidator(errorText: 'Required *'),
                              EmailValidator(errorText: 'Invalid Email')
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                          child: TextFormField(
                            controller: Registration.newpassword,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textAlign: TextAlign.left,
                            obscureText: true,
                            decoration:
                                InputDecoration(hintText: 'New Password'),
                            validator: MultiValidator(
                              [
                                RequiredValidator(errorText: 'Required *'),
                                MinLengthValidator(6,
                                    errorText: 'Minimum 6 characters'),
                                MaxLengthValidator(15,
                                    errorText: 'Maximum 15 characters'),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                          child: TextFormField(
                            controller: Registration.confirmpassword,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textAlign: TextAlign.left,
                            obscureText: true,
                            decoration:
                                InputDecoration(hintText: 'Confirm Password'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Required *';
                              }
                              if (value != Registration.newpassword.text) {
                                return 'password doesnot match';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(28, 44, 24, 0),
                    child: SizedBox(
                      width: 400,
                      height: 48,
                      child: TextButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          )),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 224, 65, 65),
                          ),
                        ),
                        onPressed: () {
                          validate();
                        },
                        child: const Text(
                          'Sign me up!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

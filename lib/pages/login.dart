// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app_admin_panel/pages/forget_password.dart';
import '../constants.dart';
import '../widgets/buttons.dart';
import '../widgets/side_bar.dart';
import '../widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool value = false;
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formkey,
          child: Row(
            children: [
              Container(
                width: 600,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/mix.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        kColorBlack.withOpacity(0.5), BlendMode.darken),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 100),
                  // child: Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: const [
                  //     SizedBox(height: 130),
                  //     Text(
                  //       'Sign In to',
                  //       style: TextStyle(
                  //         fontSize: 55,
                  //         fontWeight: FontWeight.w700,
                  //         color: kColorWhite,
                  //       ),
                  //     ),
                  //     SizedBox(height: 160),
                  //     Text(
                  //       'Ut tellus quis in imperdiet pharetra.',
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.w500,
                  //         color: kColorWhite,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ),
              ),
              // const SizedBox(
              //   width: 175,
              // ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hi, Welcome Admin!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: kUIDark,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 90,
                          ),
                          // SignInButton(
                          //   Buttons.Google,
                          //   text: "Sign in with Google",
                          //   onPressed: () {
                          //
                          //   },
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: kUIDark,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 370,
                        height: 52,
                        child: TextFieldWidget(
                          hintText: 'Enter email address',
                          ebColor: kUILight,
                          PageController: emailC,
                          vld: (_) {
                            var email = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                            if (_ == null || _ == '') {
                              return 'Enter Your Email';
                            } else if (email.hasMatch(_)) {
                              return null;
                            } else
                              return "Wrong Email Adress";
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: kUIDark,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 370,
                        height: 52,
                        child: TextFieldWidget(
                          hintText: 'Enter password',
                          ebColor: kUILight,
                          suffixIcon: Icon(
                            CupertinoIcons.eye_slash,
                            size: 17,
                            color: kUILight2,
                          ),
                          obscureText: false,
                          PageController: passwordC,
                          vld: (_) {
                            if (_ == null || _ == '') {
                              return 'Enter Your Password';
                            } else if (_.length < 8) {
                              return 'Password should at least 8 characters';
                            }

                          },
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 270,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgetPassword(),
                                ),
                              );
                            },
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: kPrimary1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 48),
                      FixedPrimary(
                        buttonText: 'Log in',
                        ontap: () {
                          if (_formkey.currentState!.validate()) {
                            login().then((_) {
                              if(_) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SideBar(),
                                  ),
                                );
                              }

                              emailC.clear();
                              passwordC.clear();
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  late FirebaseAuth auth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth = FirebaseAuth.instance;
  }

  //signup function

  // Future signup() async {
  //   try {
  //     UserCredential userCredential = await auth.createUserWithEmailAndPassword(
  //         email: emailC.text, password: passwordC.text);
  //     User? user = userCredential.user;
  //     if (user != null) {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         backgroundColor: kPrimary1,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(7),
  //         ),
  //         content: Text(
  //           "User Sign Up SuccessFully",
  //           style: TextStyle(color: Colors.white, fontSize: 19),
  //         ),
  //         duration: Duration(seconds: 2),
  //       ));
  //     }
  //   } on FirebaseException catch (e) {
  //     return showDialog(
  //       context: context,
  //       builder: (_) => AlertDialog(
  //         content: Text(
  //           e.message.toString(),
  //           style: TextStyle(
  //             color: kPrimary2,
  //             fontSize: 15,
  //           ),
  //         ),
  //         actions: [
  //           CloseButton(),
  //         ],
  //       ),
  //     );
  //   }
  // }

  //login function

  Future login() async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: emailC.text,
        password: passwordC.text,
      );
      return true;
    } on FirebaseException catch (e) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: Text(
            "${e.message}",
            style: TextStyle(
              color: kPrimary1,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
          ],
        ),
      );
      return false;

    }
  }
}

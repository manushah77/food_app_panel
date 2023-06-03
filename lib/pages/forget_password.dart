
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app_admin_panel/constants.dart';
import 'package:fruit_app_admin_panel/pages/login.dart';
import 'package:fruit_app_admin_panel/widgets/buttons.dart';

import '../widgets/text_field.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            Container(
              width: 600,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/oop.jpg'),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      kColorBlack.withOpacity(0.3), BlendMode.darken),
                ),
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
                      'Forget Password!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: kUIDark,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
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
                        vld: (_) {},
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(height: 48),
                    FixedPrimary(
                      buttonText: 'RESET',
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

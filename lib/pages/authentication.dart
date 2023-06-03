import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app_admin_panel/pages/login.dart';
import 'package:fruit_app_admin_panel/widgets/side_bar.dart';

class AuthenticateUser extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return SideBar();
    } else {
      return LoginPage();
    }
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruit_app_admin_panel/constants.dart';
import 'package:fruit_app_admin_panel/pages/authentication.dart';
import 'package:fruit_app_admin_panel/pages/login.dart';
import 'package:fruit_app_admin_panel/primary_swatch.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAKLWLlUfc0TlTIcqYLcifsPizsRq_Ccv0",
      authDomain: "foodapp-95a59.firebaseapp.com",
      projectId: "foodapp-95a59",
      storageBucket: "foodapp-95a59.appspot.com",
      messagingSenderId: "1003731349902",
      appId: "1:1003731349902:web:2c3334903f18d4a49c74df",
      measurementId: "G-8S323RW8RC",
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  // setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        unselectedWidgetColor: kFormStockColor,
        scaffoldBackgroundColor: kColorWhite,
        primarySwatch: buildMaterialColor(const Color(0xFF3B71FE)),
        // fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home:  AuthenticateUser(),
    );
  }
}

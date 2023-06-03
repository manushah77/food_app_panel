// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app_admin_panel/pages/view_product.dart';
import 'package:fruit_app_admin_panel/pages/add_product.dart';
import 'package:fruit_app_admin_panel/pages/customer_&_record.dart';
import 'package:fruit_app_admin_panel/pages/login.dart';
import 'package:fruit_app_admin_panel/pages/my_dashboard.dart';

import '../constants.dart';

class SideBar extends StatefulWidget {
  const SideBar({
    super.key,
  });

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int _selectedDestination = 0;

  static List<Widget> _widgetOptions = <Widget>[
    MyDashboard(),
    AddProduct(),
    ViewProduct(),
    CustomersAndRecod(),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 180,
          child: Drawer(
            elevation: 1,
            backgroundColor: kPrimary1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/2.png',
                    width: 130,
                    height: 105,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    selectedTileColor: Colors.green,
                    selectedColor: kPrimary1,
                    horizontalTitleGap: 0.0,
                    title: const Text(
                      'Dashboard',
                      style: TextStyle(
                        fontSize: 13,
                        color: kColorWhite,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    leading: Image.asset(
                      'assets/icons/homei.png',
                      scale: 4,
                      color: kColorWhite,
                    ),
                    selected: _selectedDestination == 0,
                    onTap: () => selectDestination(0),
                  ),
                  ListTile(
                    selectedTileColor: Colors.green,
                    selectedColor: kPrimary1,
                    horizontalTitleGap: 0.0,
                    title: const Text(
                      'Add Product',
                      style: TextStyle(
                        color: kColorWhite,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    leading: Icon(
                      Icons.add_circle_outline,
                      color: kColorWhite,
                    ),
                    selected: _selectedDestination == 1,
                    onTap: () => selectDestination(1),
                  ),
                  ListTile(
                    selectedTileColor: Colors.green,
                    selectedColor: kPrimary1,
                    horizontalTitleGap: 0.0,
                    title: const Text(
                      'View Product',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: kColorWhite),
                    ),
                    leading: Icon(
                      Icons.remove_red_eye_outlined,
                      color: kColorWhite,
                    ),
                    selected: _selectedDestination == 2,
                    onTap: () => selectDestination(2),
                  ),
                  ListTile(
                    selectedTileColor: Colors.green,
                    selectedColor: kPrimary1,
                    horizontalTitleGap: 0.0,
                    title: const Text(
                      'Customers & Record',
                      style: TextStyle(
                        color: kColorWhite,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    leading: Image.asset(
                      'assets/icons/duplicate.png',
                      scale: 3,
                      color: kColorWhite,
                    ),
                    selected: _selectedDestination == 3,
                    onTap: () => selectDestination(3),
                  ),
                  SizedBox(height: 220),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: ListTile(
                      selectedTileColor: Colors.green,
                      selectedColor: kPrimary1,
                      horizontalTitleGap: 0.0,
                      title: const Text(
                        'Log out',
                        style: TextStyle(
                          fontSize: 13,
                          color: kColorWhite,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      leading: Image.asset(
                        'assets/icons/Logout.png',
                        scale: 4,
                        color: kColorWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Scaffold(
            body: _widgetOptions.elementAt(_selectedDestination),
          ),
        ),
      ],
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}

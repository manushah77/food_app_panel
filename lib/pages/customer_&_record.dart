// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app_admin_panel/model/app_user_model.dart';

import '../constants.dart';
import '../widgets/buttons.dart';

class CustomersAndRecod extends StatefulWidget {
  @override
  State<CustomersAndRecod> createState() => _CustomersAndRecodState();
}

class _CustomersAndRecodState extends State<CustomersAndRecod> {
  bool value = false;
  bool switchValue = false;
  List<AppUserModel> userdata = [];

  getUserData() async {
    QuerySnapshot res =
        await FirebaseFirestore.instance.collection('userData').get();
    if (res.docs.isNotEmpty) {
      setState(() {
        userdata = res.docs
            .map((e) => AppUserModel.fromMap(e.data() as Map<String, dynamic>))
            .toList();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kDashboardBodyColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kPrimary1,
          elevation: 0,
          title: Text(
            'Customers & Records',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: kColorWhite,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: Container(
                    width: 1170,
                    height: 611,
                    decoration: BoxDecoration(
                      color: kColorWhite,
                    ),
                    child: SingleChildScrollView(
                      child: DataTable(
                        columnSpacing: 150,
                        dataRowHeight: 60.0,
                        horizontalMargin: 40,
                        headingTextStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: kColorWhite),
                        dataTextStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        headingRowColor: MaterialStateColor.resolveWith(
                          (states) {
                            return kPrimary1;
                          },
                        ),
                        columns: <DataColumn>[
                          DataColumn(
                            label: Text('User Name'),
                          ),
                          DataColumn(
                            label: Text('User Email'),
                          ),
                          DataColumn(
                            label: Text('User Id'),
                          ),
                        ],

                        rows: userdata
                            .map((e) => DataRow(cells: <DataCell>[
                                  DataCell(Text(
                                    e.userName!,
                                    style: TextStyle(
                                        color: kPrimary1,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  )),
                                  DataCell(Text(
                                    e.userEmail!,
                                    style: TextStyle(
                                        color: kPrimary1,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )),
                                  DataCell(Text(
                                    e.userId!,
                                    style: TextStyle(
                                        color: kPrimary1,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )),
                                ]))
                            .toList(),
                        // rows:
                        // <DataRow>[
                        //   // DataRow(
                        //   //   cells: <DataCell>[
                        //   //     DataCell(
                        //   //       Text(
                        //   //         'Azaz Khan',
                        //   //         style: TextStyle(
                        //   //           color: kUIDark,
                        //   //         ),
                        //   //       ),
                        //   //     ),
                        //   //     DataCell(
                        //   //       Transform.scale(
                        //   //         scale: 0.8,
                        //   //         child: CupertinoSwitch(
                        //   //           value: switchValue,
                        //   //           activeColor: kPrimary1,
                        //   //           trackColor: kUILight,
                        //   //           onChanged: (value) =>
                        //   //               setState(() => switchValue = value),
                        //   //         ),
                        //   //       ),
                        //   //     ),
                        //   //     DataCell(
                        //   //       Row(
                        //   //         children: [
                        //   //           Column(
                        //   //             children: [
                        //   //               SizedBox(height: 20),
                        //   //               Image.asset(
                        //   //                 'assets/icons/eye.png',
                        //   //                 scale: 5,
                        //   //               ),
                        //   //               SizedBox(height: 6),
                        //   //               Text(
                        //   //                 'View',
                        //   //                 style: TextStyle(
                        //   //                     fontSize: 13,
                        //   //                     fontWeight: FontWeight.w500,
                        //   //                     color: kPrimary1),
                        //   //               ),
                        //   //             ],
                        //   //           ),
                        //   //           SizedBox(width: 24),
                        //   //           Column(
                        //   //             children: [
                        //   //               SizedBox(height: 20),
                        //   //               Image.asset(
                        //   //                 'assets/icons/p_edit.png',
                        //   //                 scale: 5,
                        //   //               ),
                        //   //               SizedBox(height: 6),
                        //   //               Text(
                        //   //                 'Edit',
                        //   //                 style: TextStyle(
                        //   //                     fontSize: 13,
                        //   //                     fontWeight: FontWeight.w500,
                        //   //                     color: kPrimary1),
                        //   //               ),
                        //   //             ],
                        //   //           ),
                        //   //           SizedBox(width: 24),
                        //   //           Column(
                        //   //             children: [
                        //   //               SizedBox(height: 10),
                        //   //               IconButton(
                        //   //                 onPressed: () {},
                        //   //                 icon: CircleAvatar(
                        //   //                   backgroundColor: kPrimary1,
                        //   //                   radius: 20,
                        //   //                   child: Icon(
                        //   //                     Icons.delete_outline,
                        //   //                     color: Colors.white,
                        //   //                     size: 17,
                        //   //                   ),
                        //   //                 ),
                        //   //               ),
                        //   //               Text(
                        //   //                 'Delete',
                        //   //                 style: TextStyle(
                        //   //                     fontSize: 13,
                        //   //                     fontWeight: FontWeight.w500,
                        //   //                     color: kPrimary1),
                        //   //               ),
                        //   //             ],
                        //   //           ),
                        //   //         ],
                        //   //       ),
                        //   //     ),
                        //   //   ],
                        //   // ),
                        // ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

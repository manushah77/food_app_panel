// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app_admin_panel/model/add_product_model.dart';
import 'package:fruit_app_admin_panel/pages/add_product.dart';
import 'package:fruit_app_admin_panel/widgets/text_field.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../constants.dart';
import '../widgets/buttons.dart';

class ViewProduct extends StatefulWidget {
  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  AddProductModel? addProductModel;
  List<AddProductModel> addprodct = [];
  List<AddProductModel> addprodctveg = [];

  ShowProductData() async {
    QuerySnapshot res =
        await FirebaseFirestore.instance.collection('Applecollection').get();
    if (res.docs.isNotEmpty) {
      setState(() {
        addprodct = res.docs
            .map((e) =>
                AddProductModel.fromMap(e.data() as Map<String, dynamic>))
            .toList();
      });
    }
    QuerySnapshot rest = await FirebaseFirestore.instance
        .collection('VegetableCollection')
        .get();
    if (res.docs.isNotEmpty) {
      setState(() {
        addprodctveg = rest.docs
            .map((e) =>
                AddProductModel.fromMap(e.data() as Map<String, dynamic>))
            .toList();
      });
    }
    // if (res.docs.isNotEmpty) {
    //   setState(() {
    //     addProductModel = AddProductModel.fromMap(
    //         res.docs.first.data() as Map<String, dynamic>);
    //   });
    // }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ShowProductData();
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
          title: const Text(
            'View Product',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: kColorWhite,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 25,
            ),
            child: Column(
              children: [
                Wrap(
                  children: [
                    for (var all in addprodct)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 280,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black26,
                              width: 3,
                              strokeAlign:  BorderSide.strokeAlignOutside,
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: 170,
                                decoration: BoxDecoration(
                                  gradient: kGradientBlue,
                                  color: kPrimary1,
                                  borderRadius: BorderRadius.circular(20),

                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 3,
                                    strokeAlign:  BorderSide.strokeAlignOutside,
                                  ),
                                ),
                                child: Image.network(
                                  '${all.productImage}',
                                  fit: BoxFit.contain,
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${all.productName}',
                                        style: TextStyle(
                                          color: kPrimary1,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '\$${all.productPrice}',
                                        style: TextStyle(
                                          color: kPrimary1,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '',
                                        style: TextStyle(
                                          color: kPrimary1,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${all.productType}',
                                        style: TextStyle(
                                          color: kPrimary1,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      QuickAlert.show(
                                          context: context,
                                          type: QuickAlertType.confirm,
                                          text: 'Are you Sure want to Delete!',
                                          onCancelBtnTap: () {
                                            Navigator.pop(context);
                                          },
                                          showCancelBtn: true,
                                          confirmBtnText: 'Yes',
                                          confirmBtnColor: kPrimary1,
                                          onConfirmBtnTap: () async {
                                            await FirebaseFirestore.instance
                                                .collection('Applecollection')
                                                .doc(all.productId)
                                                .delete();
                                            await FirebaseFirestore.instance
                                                .collection('WishList')
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.uid)
                                                .collection('YourWishList')
                                                .doc(all.productId)
                                                .delete();
                                            await FirebaseFirestore.instance
                                                .collection('ReviewCart')
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.uid)
                                                .collection('YourReviewCart')
                                                .doc(all.productId)
                                                .delete();
                                            Navigator.pop(context);
                                          });
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {

                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Wrap(
                  children: [
                    for (var all in addprodctveg)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 280,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black26,
                              width: 3,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                width: 170,
                                decoration: BoxDecoration(
                                  gradient: kGradientBlue,
                                  color: kPrimary1,
                                  borderRadius: BorderRadius.circular(20),

                                  // borderRadius: BorderRadius.only(
                                  //   topLeft: Radius.circular(20),
                                  //   topRight: Radius.circular(20),
                                  //   bottomLeft: Radius.circular(40),
                                  //   bottomRight: Radius.circular(40),
                                  // ),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 3,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                  ),
                                ),
                                child: Image.network(
                                  '${all.productImage}',
                                  fit: BoxFit.contain,
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${all.productName}',
                                        style: TextStyle(
                                          color: kPrimary1,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '\$${all.productPrice}',
                                        style: TextStyle(
                                          color: kPrimary1,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '500 gram',
                                        style: TextStyle(
                                          color: kPrimary1,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${all.productType}',
                                        style: TextStyle(
                                          color: kPrimary1,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      QuickAlert.show(
                                          context: context,
                                          type: QuickAlertType.confirm,
                                          text: 'Are you Sure to Delete!',
                                          onCancelBtnTap: () {
                                            Navigator.pop(context);
                                          },
                                          showCancelBtn: true,
                                          confirmBtnText: 'Yes',
                                          confirmBtnColor: kPrimary1,
                                          onConfirmBtnTap: () async {
                                            await FirebaseFirestore.instance
                                                .collection('VegetableCollection')
                                                .doc(all.productId)
                                                .delete();
                                            Navigator.pop(context);
                                          });

                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app_admin_panel/model/add_product_model.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../constants.dart';
import '../widgets/buttons.dart';
import '../widgets/text_field.dart';

class AddProduct extends StatefulWidget {
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  AddProductModel? addProductModel;
  final formkey = GlobalKey<FormState>();

  bool value = false;
  List valuees = ['500 gram', '1 kg', '2 kg'];

  String dropdownValue =
      '500 gram'; // final _controller = CountDownController();
  TextEditingController nameC = TextEditingController();
  TextEditingController typeC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  TextEditingController imageC = TextEditingController();

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
            'Add Product',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: kColorWhite,
            ),
          ),
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.only(right: 40.5),
          //     child: Row(
          //       children: [
          //         Image.asset(
          //           'assets/icons/eye.png',
          //           scale: 5,
          //         ),
          //         SizedBox(width: 10),
          //         Image.asset(
          //           'assets/icons/p_edit.png',
          //           scale: 5,
          //         ),
          //         SizedBox(width: 5),
          //         IconButton(
          //           onPressed: () {},
          //           icon: CircleAvatar(
          //             backgroundColor: kPrimary1,
          //             radius: 20,
          //             child: Icon(
          //               Icons.delete_outline,
          //               color: Colors.white,
          //               size: 17,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ],
        ),
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          'Product Name',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kPrimary1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: SizedBox(
                          width: 370,
                          height: 52,
                          child: TextFieldWidget(
                            PageController: nameC,
                            hintText: 'Enter Product Name',
                            ebColor: kUILight,
                            vld: (_) {
                              if (_ == null || _ == '') {
                                return 'Enter Service';
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //detail

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          'Add Product Image',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kPrimary1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Row(
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.only(left: 18.0),
                  //       child: Container(
                  //         width: 370,
                  //         height: 170,
                  //         decoration: BoxDecoration(
                  //           border: Border.all(
                  //             color: Colors.black26,
                  //             width: 1,
                  //           ),
                  //         ),
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             CircleAvatar(
                  //               backgroundColor: kPrimary1,
                  //               radius: 30,
                  //               child: Icon(
                  //                 Icons.add,
                  //                 color: kColorWhite,
                  //               ),
                  //             ),
                  //             SizedBox(
                  //               height: 10,
                  //             ),
                  //             Text(
                  //               'Add Image',
                  //               style: TextStyle(
                  //                 color: kPrimary1,
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.w500,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: SizedBox(
                          width: 370,
                          height: 52,
                          child: TextFieldWidget(
                            PageController: imageC,
                            hintText: 'Enter Image link',
                            ebColor: kUILight,
                            vld: (_) {
                              if (_ == null || _ == '') {
                                return 'Enter Image Url';
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  //subservice

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          'Product Type',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kPrimary1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: SizedBox(
                          width: 370,
                          height: 52,
                          child: TextFieldWidget(
                            PageController: typeC,
                            hintText: 'Enter Product Type',
                            ebColor: kUILight,
                            vld: (_) {
                              if (_ == null || _ == '') {
                                return 'Enter Type';
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //category drop down

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          'Product Unit',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kPrimary1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Container(
                            width: 330,
                            height: 57,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(color: kUILight, width: 1)),
                            child: DropdownButtonHideUnderline(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 8.0, left: 9),
                                child: DropdownButton<String>(
                                  value: dropdownValue,
                                  iconSize: 24,
                                  elevation: 16,
                                  style:
                                      TextStyle(color: kUIDark, fontSize: 17),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    '500 gram',
                                    '1 kg',
                                    '2 kg',
                                  ].map<DropdownMenuItem<String>>((values) {
                                    return DropdownMenuItem<String>(
                                      value: values,
                                      child: Text(
                                        values,
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //unit price

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          'Product Price',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kPrimary1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: SizedBox(
                          width: 100,
                          height: 52,
                          child: TextFieldWidget(
                            PageController: priceC,
                            hintText: '',
                            ebColor: kUILight,
                            vld: (_) {
                              if (_ == null || _ == '') {
                                return 'Enter unit';
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  FixedPrimary(
                    buttonText: 'Add',
                    ontap: () async {
                      if (formkey.currentState!.validate()) {
                        if (typeC.text == 'fruit') {
                          final docs = FirebaseFirestore.instance
                              .collection('Applecollection')
                              .doc();
                          AddProductModel productModel = AddProductModel(
                            productName: nameC.text,
                            productId: docs.id,
                            productImage: imageC.text,
                            productPrice: double.parse(priceC.text),
                            productType: typeC.text,
                            productUnit: valuees,
                          );
                          await docs.set(productModel.toMap());
                        } else {
                          final docss = FirebaseFirestore.instance
                              .collection('VegetableCollection')
                              .doc();
                          AddProductModel productModel = AddProductModel(
                            productName: nameC.text,
                            productId: docss.id,
                            productPrice: double.parse(priceC.text),
                            productType: typeC.text,
                            productImage: imageC.text,
                            productUnit: valuees,
                          );
                          await docss.set(productModel.toMap());
                        }

                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            text: 'Product Added Successfully!',
                            confirmBtnText: 'Done',
                            confirmBtnColor: kPrimary1,
                            onConfirmBtnTap: () async {
                              nameC.clear();
                              typeC.clear();
                              priceC.clear();
                              imageC.clear();
                              Navigator.pop(context);
                            });

                        // showDialog(
                        //   context: context,
                        //   builder: (context) => AlertDialog(
                        //     content: Column(
                        //       mainAxisSize: MainAxisSize.min,
                        //       children: [
                        //         Text(
                        //           'Product Added Success fully',
                        //         ),
                        //         Row(
                        //           mainAxisAlignment: MainAxisAlignment.end,
                        //           children: [
                        //             CloseButton(
                        //               onPressed: () {
                        //                 nameC.clear();
                        //                 typeC.clear();
                        //                 priceC.clear();
                        //                 Navigator.pop(context);
                        //               },
                        //             ),
                        //           ],
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // );
                      }
                    },
                  ),

                  SizedBox(
                    height: 20,
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

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../constants.dart';

class TextFieldWidget extends StatefulWidget {
  final String hintText;
  final Color ebColor;
  final Icon? suffixIcon;
  final bool? obscureText;
  final Function(String?) vld;
  final PageController;

  TextFieldWidget({
    Key? key,
    required this.hintText,
    this.suffixIcon,
    this.obscureText,
    required this.ebColor,
    required this.vld,
    this.PageController,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:(_) => widget.vld(_),
      controller: widget.PageController,
      obscureText: widget.obscureText ?? false,
      style: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: kUIDark),
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon,
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: kPrimary1, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: kUILight, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: widget.ebColor, width: 1),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: kUILight2,
        ),
      ),
    );
  }
}

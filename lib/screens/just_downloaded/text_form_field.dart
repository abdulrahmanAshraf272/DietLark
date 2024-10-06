import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';

class TextFormGlobal extends StatelessWidget {
  TextFormGlobal({
    super.key,
    required this.controller,
    required this.text,
    required this.textInputType,
    required this.obscure,
  });

  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: EdgeInsets.only(right: 10, top: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 7)
          ]),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscure,
        decoration: InputDecoration(
            hintText: text,
            border: InputBorder.none,
            hintStyle: TextStyle(
                fontFamily: kPrimaryFont,
                color: Colors.black.withOpacity(0.3))),
      ),
    );
  }
}

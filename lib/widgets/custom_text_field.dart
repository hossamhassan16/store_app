import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.hintText, this.inputType, this.onChanged, super.key});
  Function(String)? onChanged;
  String? hintText;
  bool? obsecureText;
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.circular(8),
          )),
    );
  }
}

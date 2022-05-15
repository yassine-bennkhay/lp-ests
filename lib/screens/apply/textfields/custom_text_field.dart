import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.labelText,
    required this.textInputType,
    required this.message,
    required this.valuedata,
  }) : super(key: key);

  final String labelText;
  final TextInputType textInputType;
  final String message;
  String valuedata;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (value) {
        valuedata = value!;
      },
      keyboardType: textInputType,
      decoration: InputDecoration(
          labelStyle: const TextStyle(
            color: Colors.green,
          ),
          labelText: labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 2.0),
            borderRadius: BorderRadius.circular(8.0),
          )),
      validator: (text) {
        if (text!.isEmpty) {
          return message;
        } else {
          return null;
        }
      },
    );
  }
}

import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Function(String value) onChanged;

  CustomTextField({
    this.hintText,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        obscureText: obscureText,
        style: TextStyle(color: white1),
        cursorColor: white1,
        decoration: InputDecoration(
          fillColor: Colors.white24,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(7)),
          hintText: hintText,
          hintStyle: TextStyle(color: medEmphasisTextColor),
          filled: true,
          isDense: true,
        ),
        onChanged: onChanged,
      ),
    );
  }
}

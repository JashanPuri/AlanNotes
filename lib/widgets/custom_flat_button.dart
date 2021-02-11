import 'package:flutter/material.dart';

import '../constants.dart';

class CustomFlatButton extends StatelessWidget {
  final String titleText;
  final Function onTap;

  CustomFlatButton({this.onTap, this.titleText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: FlatButton(
        minWidth: double.infinity,
        height: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        color: Colors.blue[800],
        disabledColor: Colors.blue[800],
        onPressed: onTap,
        child: Text(
          'Sign up',
          style: TextStyle(
            color: white1,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

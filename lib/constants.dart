import 'package:flutter/material.dart';

const themeColor = Color.fromRGBO(26, 26, 26, 1);
const accentColor = Color.fromRGBO(64, 64, 64, 1);
const white1 = Color.fromRGBO(255, 255, 255, 1);

Widget textWidget(
    {text, fontsize = 18.0, fontweight = FontWeight.normal, color}) {
  return Text(
    text,
    style: TextStyle(fontSize: fontsize, fontWeight: fontweight, color: color),
  );
}

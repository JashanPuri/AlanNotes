import 'package:flutter/material.dart';
import './constants.dart';

class GridItem extends StatelessWidget {
  final title;
  final note;
  final date;

  GridItem({this.title,this.note,this.date});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textWidget(text: title,color: white1),
          textWidget(text: date.toString() ,color: white1)
      ]
      ),
      decoration: BoxDecoration(
        color: accentColor,
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}

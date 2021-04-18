import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:intl/intl.dart';

class GridItem extends StatelessWidget {
  final title;
  final note;
  final date;

  GridItem({this.title, this.note, this.date});
  @override
  Widget build(BuildContext context) {
    //print("grid item called");
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        textWidget(
            text: title,
            color: white1,
            fontsize: 20.0,
            fontweight: FontWeight.w700),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: textWidget(text: note, color: white1, fontsize: 16.0),
        )),
        textWidget(
            text: DateFormat("dd-MM-yyyy").format(date),
            color: medEmphasisTextColor,
            fontweight: FontWeight.w600)
      ]),
      decoration: BoxDecoration(
          color: accentColor, borderRadius: BorderRadius.circular(20)),
    );
  }
}

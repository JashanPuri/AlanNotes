import 'package:flutter/material.dart';

// const themeColor = Color.fromRGBO(26, 26, 26, 1);
const themeColor = Color.fromRGBO(18, 18, 18, 1);
const accentColor = Color.fromRGBO(64, 64, 64, 0.5);
const secondaryThemeColor = Color.fromRGBO(13, 245, 227, 0.95);
const white1 = Color.fromRGBO(255, 255, 255, 0.87);
const medEmphasisTextColor = Colors.white60;


Widget textWidget(
    {text,double fontsize = 18.0, fontweight = FontWeight.normal, color}) {
  return Text(
    text,
    overflow: TextOverflow.ellipsis,
    maxLines: 3,
    style: TextStyle(
      fontSize: fontsize,
      fontWeight: fontweight, 
      color: color,
      ),
  );
}

void showErrorDialog (String message,BuildContext ctx) {
    showDialog(
        context: ctx,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.grey[900],
        title: textWidget(text:'An Error Occurred',color: white1,fontweight: FontWeight.bold,fontsize: 25),
        content: textWidget(text:message,color: white1),
        actions: [
          FlatButton(
            child: textWidget(text:'Okay',color: Colors.grey[400],),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      )
    );
  }
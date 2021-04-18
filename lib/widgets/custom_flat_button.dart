import 'package:flutter/material.dart';

import '../constants.dart';

class CustomFlatButton extends StatelessWidget {
  final String titleText;
  final Function onTap;
  final bool enabled;

  CustomFlatButton({this.onTap, this.titleText, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Opacity(
          opacity: enabled ? 1 : 0.5,
          child: FlatButton(
            minWidth: 200,
            height: 60,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            color: Theme.of(context).accentColor,
            disabledColor: Theme.of(context).accentColor,
            onPressed: enabled ? onTap : null,
            child: Text(
              titleText,
              style: TextStyle(
                color: themeColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../constants.dart';

class AlternateAuthSelectorButton extends StatelessWidget {

  final String text1, text2;
  final Function onTap;

  AlternateAuthSelectorButton({this.onTap, this.text1, this.text2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: FlatButton(
        minWidth: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12),
        highlightColor: Colors.transparent,
        onPressed: onTap,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: text1,
                style: TextStyle(
                  color: medEmphasisTextColor,
                  fontSize: 15,
                ),
              ),
              TextSpan(
                text: text2,
                style: TextStyle(
                  color: secondaryThemeColor,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

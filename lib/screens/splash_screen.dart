import 'package:alan_notes_app/constants.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 70,
          width: 180,
          child: Column(
            children: [
              textWidget(text:'Loading...',color: white1),
              SizedBox(height: 15),
              LinearProgressIndicator()
            ],
          ),
          ),
      ),
    );
  }
}

import 'package:alan_notes_app/constants.dart';
import 'package:flutter/material.dart';
import './dashboard.dart';
import './edit_notes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //primarySwatch: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DashBoard(),
      routes: {
        EditNotes.routeName: (context) => EditNotes()
      },
    );
  }
}

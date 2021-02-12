import 'package:alan_notes_app/constants.dart';
import 'package:alan_notes_app/providers/notes_provider.dart';
import 'package:alan_notes_app/screens/edit_notes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/dashboard.dart';
import './auth/sign_up_screen.dart';
import './auth/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          //primarySwatch: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: DashBoard(),
        home: DashBoard(),
        routes: {
          SignUpScreen.routeName: (ctx) => SignUpScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          DashBoard.routeName: (ctx) => DashBoard(),
          EditNotes.routeName: (ctx) => EditNotes()
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //primarySwatch: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: DashBoard(),
      home: LoginScreen(),
      routes: {
        SignUpScreen.routeName: (ctx) => SignUpScreen(),
        LoginScreen.routeName: (ctx) => LoginScreen(),
      },
    );
  }
}

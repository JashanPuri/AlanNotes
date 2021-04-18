//import 'package:alan_notes_app/constants.dart';
import 'package:alan_notes_app/providers/auth_provider.dart';
import 'package:alan_notes_app/providers/notes_provider.dart';
import 'package:alan_notes_app/screens/edit_notes.dart';
import 'package:alan_notes_app/screens/splash_screen.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProxyProvider<Auth, NotesProvider>(
          update: (ctx, auth, prevNotes) =>
              NotesProvider(authToken: auth.token, userId: auth.userId),
        ),
      ],
      child: Consumer<Auth>(
          builder: (ctx, authObject, _) => MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                    //primaryColor: Color.fromRGBO(64, 64, 64, 0.5),
                    scaffoldBackgroundColor: Colors.black87,
                    accentColor: Colors.tealAccent[700],
                    appBarTheme: AppBarTheme(color: Colors.black87),
                    errorColor: Colors.redAccent,
                    primaryTextTheme: TextTheme(
                      bodyText1: TextStyle(color: Colors.white60),
                    )),
                home: authObject.isAuth
                    ? DashBoard()
                    : FutureBuilder(
                        future: authObject.tryAutoLogin(),
                        builder: (ctx, authResultSnapshot) {
                          print("Home page called");
                          return authResultSnapshot.connectionState ==
                                  ConnectionState.waiting
                              ? SplashScreen()
                              : LoginScreen();
                        }),
                routes: {
                  SignUpScreen.routeName: (ctx) => SignUpScreen(),
                  LoginScreen.routeName: (ctx) => LoginScreen(),
                  DashBoard.routeName: (ctx) => DashBoard(),
                  EditNotes.routeName: (ctx) => EditNotes()
                },
              )),
    );
  }
}

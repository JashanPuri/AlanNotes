import 'package:alan_notes_app/screens/dashboard.dart';
import 'package:flutter/material.dart';

import './sign_up_screen.dart';

import '../constants.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_flat_button.dart';
import '../widgets/alternate_auth_selector_button.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';

  bool get isButtonEnabled {
    return _email.isNotEmpty && _password.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 100),
                    Text(
                      'Log In,',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: white1,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Please log in to continue!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: medEmphasisTextColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 40),
                    CustomTextField(
                      hintText: 'Email ID',
                      onChanged: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                    ),
                    CustomTextField(
                      hintText: 'Password',
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 50,),
                    CustomFlatButton(
                      titleText: 'LOGIN',
                      onTap: () {
                        print(_email);
                        print(_password);
                        Navigator.of(context)
                            .pushReplacementNamed(DashBoard.routeName);
                      },
                      enabled: isButtonEnabled,
                    ),
                    Center(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          alignment: Alignment.center,
                          width: 200,
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: secondaryThemeColor,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Divider(
            color: medEmphasisTextColor,
            height: 0,
          ),
          AlternateAuthSelectorButton(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(SignUpScreen.routeName);
            },
            text1: "Don't have an account? ",
            text2: "Sign Up",
          )
        ],
      ),
    );
  }
}

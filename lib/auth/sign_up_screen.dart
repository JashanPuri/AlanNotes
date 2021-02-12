import 'package:flutter/material.dart';

import './login_screen.dart';

import '../constants.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_flat_button.dart';
import '../widgets/alternate_auth_selector_button.dart';

class SignUpScreen extends StatefulWidget {

  static const routeName = '/sign-up';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _username = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  bool get isButtonEnabled {
    return _username.isNotEmpty &&
        _email.isNotEmpty &&
        _password.isNotEmpty &&
        _confirmPassword.isNotEmpty;
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
                      'Create Account,',
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
                      'Sign up to get started!',
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
                      hintText: 'Username',
                      onChanged: (value) {
                        setState(() {
                          _username = value;
                        });
                      },
                    ),
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
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                    ),
                    CustomTextField(
                      hintText: 'Confirm password',
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          _confirmPassword = value;
                        });
                      },
                    ),
                    SizedBox(height: 50,),
                    CustomFlatButton(
                      titleText: 'SIGNUP',
                      onTap: () {
                        print(_username);
                        print(_email);
                        print(_password);
                        print(_confirmPassword);
                      },
                      enabled: isButtonEnabled,
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
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
            text1: "Already have an account? ",
            text2: "Log In",
          )
        ],
      ),
    );
  }
}

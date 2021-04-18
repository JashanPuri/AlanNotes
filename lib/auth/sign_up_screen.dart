import 'package:alan_notes_app/models/http_exception.dart';
import 'package:alan_notes_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';

import './login_screen.dart';

import '../constants.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_flat_button.dart';
import '../widgets/alternate_auth_selector_button.dart';
import 'package:provider/provider.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isLoading = false;

  bool get isButtonEnabled {
    return _username.isNotEmpty &&
        _email.isNotEmpty &&
        _password.isNotEmpty &&
        _confirmPassword.isNotEmpty;
  }

  Future<void> submit() async {
    print("submit called");
    if (_formKey.currentState.validate()) {
      print("Not valid");
      //return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = !_isLoading;
    });
    try {
      await Provider.of<Auth>(context, listen: false).signup(_email, _password);
    } on HttpException catch (error) {
      var errorMessage = 'Authentication Failed.';
      if (error.toString().contains('EMAIL_EXIST')) {
        errorMessage = 'This Email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } 
      showErrorDialog(errorMessage, context);
    }
    setState(() {
      _isLoading = !_isLoading;
    });
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
                key: _formKey,
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
                        hintText: 'Password (at least 6 characters)',
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                        validator: (value) {
                          if (value.length < 5) {
                            return 'Password is too short!';
                          }
                        }),
                    CustomTextField(
                      hintText: 'Confirm password',
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          _confirmPassword = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    _isLoading
                        ? Center(child: CircularProgressIndicator())
                        : CustomFlatButton(
                            titleText: 'SIGNUP',
                            onTap: submit,
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

import 'package:alan_notes_app/models/http_exception.dart';
import 'package:alan_notes_app/providers/auth_provider.dart';
//import 'package:alan_notes_app/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isLoading = false;

  bool get isButtonEnabled {
    return _email.isNotEmpty && _password.isNotEmpty;
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
      await Provider.of<Auth>(context, listen: false).login(_email, _password);
    } on HttpException catch (error) {
      var errorMessage = 'Authentication Failed.';
      if (error.toString().contains('EMAIL_EXIST')) {
        errorMessage = 'This Email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'This password is Invalid.';
      }
      showErrorDialog(errorMessage, context);
    } finally {
      if (mounted) { // checks if stateful widget is present or not
        setState(() {
          _isLoading = !_isLoading;
        });
      }
    }
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
                    SizedBox(
                      height: 50,
                    ),
                    _isLoading
                        ? Center(child: CircularProgressIndicator())
                        : CustomFlatButton(
                            titleText: 'LOGIN',
                            onTap: submit,
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
                              color: Theme.of(context).accentColor,
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

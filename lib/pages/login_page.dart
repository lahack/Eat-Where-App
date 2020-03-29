//import 'package:eat_where/main.dart';
import 'package:eat_where/pages/register_page.dart';
import 'package:flutter/material.dart';
import '../utils/color_util.dart';
import 'package:flutter/cupertino.dart';

/*
  Login page.
 */
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle textStyle = TextStyle(fontSize: 20.0);

  final _formKey = GlobalKey<FormState>();
  String _password;
  String _username;

  @override
  Widget build(BuildContext context) {
    final usernameField = TextFormField(
      onSaved: (value) => _username = value,
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter some text";
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      obscureText: false,
      style: textStyle,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Username",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final passwordField = TextFormField(
      onSaved: (value) => _password = value,
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter some text";
        }
        return null;
      },
      obscureText: false,
      style: textStyle,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: ColorUtils.themeColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          final form = _formKey.currentState;
          form.save();

          if (form.validate()) {
            print('username: $_username, password: $_password');
            //TODO -> GO TO FIREBASE AND TRAVERSE TO ANOTHER PAGE
          }
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: textStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final signUpButton = Material(
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => RegisterPage()),
            (Route<dynamic> route) => false,
          );
        },
        child: Text("New User? SIGN UP",
            textAlign: TextAlign.center, style: TextStyle(color: Colors.black)),
      ),
    );
    return Scaffold(
        appBar: AppBar(
          title: Text('Eat-where'),
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            //color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 145.0,
                        child: Image.asset(
                          "assets/images/logo.png", //add logo.png to the page
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 55.0),
                      usernameField,
                      SizedBox(height: 25.0),
                      passwordField,
                      SizedBox(
                        height: 35.0,
                      ),
                      loginButton,
                      SizedBox(
                        height: 15.0,
                      ),
                      signUpButton
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

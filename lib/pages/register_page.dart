import 'package:firebase_auth/firebase_auth.dart';

import '../main.dart';
import '../utils/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextStyle textStyle = TextStyle(fontSize: 20.0);
  final _formKey = GlobalKey<FormState>();
  String _password;
  String _confirmPassword;
  String _username;

  Future<void> _fireAuthSignUp() async {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _username, password: _password)
        .then((authResult) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Home(authResult.user.uid, 0)),
            (Route<dynamic> route) => false,
      );
    })
        .catchError((error) {
      print(error);
    });
  }

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

    final confirmPassField = TextFormField(
      onSaved: (value) => _confirmPassword = value,
      validator: (value) {
        if (value.isEmpty) {
          return "Please enter some text";
        } else if (value != _password) {
          return "Passwords should match";
        }
        return null;
      },
      obscureText: false,
      style: textStyle,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Confirm password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final signUpButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: ColorUtils.themeColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          //Get the result and deliver it to the back end
          final form = _formKey.currentState;
          form.save();

          if (form.validate()) {
            print('username: $_username, password: $_password');
            //TODO -> GO TO FIREBASE AND TRAVERSE TO ANOTHER PAGE
            _fireAuthSignUp();
          }
        },
        child: Text("SignUp",
            textAlign: TextAlign.center,
            style: textStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('Eat-where',
            style: TextStyle(color: ColorUtils.lightColor),
          ),
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: SingleChildScrollView(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 155.0,
                          child: Image.asset(
                            "assets/images/logo.png", //add logo.png to the page
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 45.0),
                        usernameField,
                        SizedBox(height: 25.0),
                        passwordField,
                        SizedBox(height: 25.0),
                        confirmPassField,
                        SizedBox(
                          height: 35.0,
                        ),
                        signUpButton,
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

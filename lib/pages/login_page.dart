import 'package:eat_where/main.dart';
import 'package:flutter/material.dart';

/*
  Login page.
  TODO: text field resign responder, text field move along keyboard
 */
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // TODO: delete all children
            Text("Login page"),
            RaisedButton(
              child: Text("hello!"),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                      (Route<dynamic> route) => false,
                );
              },
            )
          ],
        )
      ),
    );
  }
}
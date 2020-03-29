import '../utils/color_util.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatelessWidget {
  TextStyle textStyle = TextStyle(fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final usernameField = TextField(
      obscureText: false,
      style: textStyle,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Username",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    
    final passwordField = TextField(
      obscureText: false,
      style: textStyle,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final confirmPassField = TextField(
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
        onPressed: () {
          //Get the result and deliver it to the back end
        },
        child: Text("SignUp",
            textAlign: TextAlign.center,
            style: textStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('Eat-where'),
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
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
        ));
  }
}
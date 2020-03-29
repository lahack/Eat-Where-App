import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'me_preference.dart';

class Settings extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(30),
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Colors.amber[100],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25.0),
                  bottomLeft: Radius.circular(25.0)
              )
          ),
          padding: const EdgeInsets.all(18),
          alignment: Alignment.center,
          child: Container(
            child:const Text('Account',style: TextStyle(fontSize: 18),textAlign: TextAlign.center),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.amber[200],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0)
              )
          ),
          padding: const EdgeInsets.all(18),
          alignment: Alignment.center,
          child: Container(
            child:const Text('Friends',style: TextStyle(fontSize: 18),textAlign: TextAlign.center),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0)
              )
          ),
          padding: const EdgeInsets.all(18),
          alignment: Alignment.center,
          child: Container(
            child:const Text('General',style: TextStyle(fontSize: 18),textAlign: TextAlign.center),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[400],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25.0),
                  bottomLeft: Radius.circular(25.0)
              )
          ),
          padding: const EdgeInsets.all(18),
          alignment: Alignment.center,
          child: Container(
            child:const Text('Log Out',style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center),
          ),
        ),
      ],
    );
  }
}
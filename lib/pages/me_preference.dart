import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Preference extends StatefulWidget {
  @override
  _PreferenceState createState() => _PreferenceState();
}

class _PreferenceState extends State<Preference> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25),
        Divider(),
        Row(
          children: <Widget>[
            CustomButton(),
            CustomButton(),
            CustomButton(),
          ],
        ),
        //todo add parameter here to create a different button with tags fetched
        //from db
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton();
  final tags = "American";
  //todo also change here

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: new EdgeInsets.symmetric(horizontal: 6.0),
        child: RawMaterialButton(
          fillColor: Colors.amber[700],
          splashColor: Colors.amberAccent,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Text(
                  //todo default msg need to be changed
                  "American",
                  maxLines: 1,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Icon(
                  Icons.highlight_off,
                  color: Colors.amberAccent,
                ),
              ],
            ),
          ),
        onPressed: null,
        //todo change null here into link with database
        shape: const StadiumBorder(),
        )
    );
  }
}

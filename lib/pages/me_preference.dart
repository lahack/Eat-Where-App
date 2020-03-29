import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Preference extends StatefulWidget {
  @override
  _PreferenceState createState() => _PreferenceState();
}

class _PreferenceState extends State<Preference> {
  //todo buggy stuff here, size of text got limited. one more character then we dead
  List<CustomButton> _ButtonList = [CustomButton(), CustomButton(), CustomButton(), CustomButton()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 2,
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 0,
            mainAxisSpacing: 10,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: _ButtonList,
        )
    );
        //todo add parameter here to create a different button with tags fetched
        //from db
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
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Text(
                  //todo default msg need to be changed
                  "American",
                  maxLines: 1,
                  style: TextStyle(color: Colors.white, fontSize: 16),
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
        ));
  }
}

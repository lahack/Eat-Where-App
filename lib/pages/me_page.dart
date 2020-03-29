import 'package:eat_where/pages/me_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'me_history.dart';
import 'me_preference.dart';

/*
  Me tab.
 */
class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  final Map<int, Widget> segtabs = const <int, Widget>{
    0: Text('History',style: TextStyle(fontSize: 18),),
    1: Text('Preference',style: TextStyle(fontSize: 18),),
    2: Text('Settings',style: TextStyle(fontSize: 18),),
  };

  final color = Colors.amber[800];
  final size = 36.0;

  //the content of each pages is defined here
  final Map<int, Widget> icons = <int, Widget>{
    0: History(),
    1: Preference(),
    2: Settings(),
  };

  int sharedValue = 0;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 500.0,
                  height: 40.0,
                ),
                Container(
                    width: 130.0,
                    height: 130.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://i.imgur.com/BoN9kdC.png")))),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Black Superman", textScaleFactor: 1.3),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
            ),
            SizedBox(
              width: 500.0,
              child: CupertinoSegmentedControl<int>(
                borderColor: Colors.grey,
                pressedColor: Colors.grey,
                selectedColor: Colors.grey,
                children: segtabs,
                onValueChanged: (int val) {
                  setState(() {
                    sharedValue = val;
                  });
                },
                groupValue: sharedValue,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0.0,
                  horizontal: 16.0,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 0.0,
                  ),
                  child: icons[sharedValue],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

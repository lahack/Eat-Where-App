import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
  Me tab.
 */
class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  final Map<int, Widget> segtabs = const <int, Widget>{
    0: Text('History'),
    1: Text('Preference'),
    2: Text('Settings'),
  };

  final color = Colors.amber[800];
  final size = 36.0;
  final Map<int, Widget> icons = <int, Widget>{
    0: new ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.wb_sunny),
            title: Text('Everybody\'s Kitchen'),
            trailing: FavoriteWidget(),
          ),
          ListTile(
            leading: Icon(Icons.brightness_3),
            title: Text('Parkside Canteen'),
            trailing: FavoriteWidget(),
          ),
          ListTile(
            leading: Icon(Icons.wb_sunny),
            title: Text('Bcd Tofu House'),
            trailing: FavoriteWidget(),
          ),
        ],
      ),
    1: Center(
      child: FlutterLogo(
        colors: Colors.teal,
        size: 200.0,
      ),
    ),
    2: Center(
      child: FlutterLogo(
        colors: Colors.cyan,
        size: 200.0,
      ),
    ),
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
                  height: 30.0,),
                Container(
                    width: 130.0,
                    height: 130.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "https://i.imgur.com/BoN9kdC.png")
                        )
                    )),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Black Superman",
                      textScaleFactor: 1.3),
                ),
                SizedBox(
                width: 500.0,
                height: 10.0,
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

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorit = false;
  void _toggleFavorite() {
    setState(() {
      if (_isFavorit) {
        _isFavorit = false;
      } else {
        _isFavorit = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorit ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.amber[800],
            onPressed: _toggleFavorite,
          ),
        ),
      ],
    );
  }
}

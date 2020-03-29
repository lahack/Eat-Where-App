import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}
class _HistoryState extends State<History>{
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Divider(),
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
        ListTile(
          leading: Icon(Icons.wb_sunny),
          title: Text('Chipotle'),
          trailing: FavoriteWidget(),
        ),
        ListTile(
          leading: Icon(Icons.brightness_3),
          title: Text('McDonald'),
          trailing: FavoriteWidget(),
        ),
        ListTile(
          leading: Icon(Icons.wb_sunny),
          title: Text('Pop-eyes'),
          trailing: FavoriteWidget(),
        ),
        ListTile(
          leading: Icon(Icons.brightness_3),
          title: Text('Bcd Tofu House'),
          trailing: FavoriteWidget(),
        ),
      ],
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorite = false;
  void _toggleFavorite() {
    setState(() {
      if (_isFavorite) {
        _isFavorite = false;
        //when tapped we need to deselect or select
        //todo
      } else {
        _isFavorite = true;
        //todo
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
            icon: (_isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
            color: Colors.pink[400],
            onPressed: _toggleFavorite,
            //link this to database, you need to go to functions defined above
          ),
        ),
      ],
    );
  }
}


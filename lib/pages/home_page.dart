import 'package:eat_where/utils/time_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
  Home tab.

  Contains a Column with:
    1. A Text for date
    2. A Container for restaurant info
        a. Several Columns and Rows
    3. A Row for two buttons
    *. Uses Expanded to fill empty space
 */
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _hasSelected;  // Whether the user has selected a restaurant

  @override
  void initState() {
    super.initState();
    _hasSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    // Text on the top to display date
    var _dateText = Text(TimeUtils.dayFormat(DateTime.now()),
      style: TextStyle(fontSize: 24),
    );

    // TODO: complete two widget lists

    // All widgets for restaurant overview
    var _overviewWidgets = <Widget>[
      _dateText,
    ];

    // All widgets for restaurant detail
    var _detailWidgets = <Widget>[
      _dateText,
    ];

    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        // TODO: add margin, alignment and padding
//        mainAxisAlignment: MainAxisAlignment.center,
        children: _hasSelected ? _detailWidgets : _overviewWidgets,
      ),
    );
  }
}
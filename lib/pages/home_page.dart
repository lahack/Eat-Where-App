import 'dart:core';

import 'package:eat_where/models/detailWidget.dart';
import 'package:eat_where/utils/time_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/overviewidget.dart';
import '../models/detailWidget.dart';
import '../models/cafeInfo.dart';
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
  bool _hasSelected; // Whether the user has selected a restaurant

  List<CafeInfo> _recommendations;
  int _recommendationIndex = 0;

  Function DummyInit() {
    //For debug Use only
    _recommendations = new List(3);
    String imageLink =
        'https://magazine.viterbi.usc.edu/wp-content/uploads/Kelly_Sanders_121.jpg';

    String imageTitle = 'Parkside Canteen';
    String imageType = 'Cafeteria';
    int walkMin = 17;
    double stars = 4.5;
    String mapLink =  'https://magazine.viterbi.usc.edu/wp-content/uploads/Kelly_Sanders_121.jpg';
    String address = '21 Fake addr Los Angeles Ca';
    String phoneNum = "213-349-3930";
    var parkside = new CafeInfo(
        imageLink: imageLink,
        imageTitle: imageTitle,
        imageType: imageType,
        walkMin: walkMin,
        stars: stars,
        mapLink:mapLink,
        address:address,
        phoneNumber: phoneNum
        );
    parkside.foodImageLinks = new List<String>(3);
    parkside.foodNames = new List<String>(3);
    parkside.foodImageLinks[0] =
        'https://magazine.viterbi.usc.edu/wp-content/uploads/Kelly_Sanders_121.jpg';
    parkside.foodNames[0] = "Salad";
    parkside.foodImageLinks[1] =
        'https://magazine.viterbi.usc.edu/wp-content/uploads/Kelly_Sanders_121.jpg';
    parkside.foodNames[1] = "Salad";
    parkside.foodImageLinks[2] =
        'https://magazine.viterbi.usc.edu/wp-content/uploads/Kelly_Sanders_121.jpg';
    parkside.foodNames[2] = "Salad";
    _recommendations[0] = parkside;
    _recommendations[1] = parkside;
    _recommendations[2] = parkside;
  }

  Function GetRecommendations() {
    //TODO: GET Recommendations from backend
    DummyInit();
  }

  @override
  void initState() {
    super.initState();
    _hasSelected = false;
    GetRecommendations();
  }

  @override
  Widget build(BuildContext context) {
    //
    //initState();
    // Text on the top to display date
    var _dateText = Text(
      TimeUtils.dayFormat(DateTime.now()),
      style: TextStyle(fontSize: 24),
    );

    final nextButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.25,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          setState(() {
            if (_recommendationIndex < _recommendations.length - 1) {
              _recommendationIndex += 1;
            }
          });
        },
        child: Text("Next",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final downButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.orange,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.25,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          setState(() {
            _hasSelected = true;
          });
        },
        child: Text("Down!",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final backButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width * 0.4,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          setState(() {
            _hasSelected = false;
          });
        },
        child: Text("Back!",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );

    // All widgets for restaurant overview
    var _overviewWidgets = Column(
      children: <Widget>[
        OverviewWidget(_recommendationIndex, _recommendations),
        SizedBox(
          height: 20,
        ),
        //nextButton,
        Row(
          children: <Widget>[
            SizedBox(
              width: 50,
            ),
            nextButton,
            SizedBox(
              width: 60,
            ),
            downButton
          ],
        )
      ],
    );

    // All widgets for restaurant detail
    var _detailWidgets = Column(
      children: <Widget>[
      DetailWidget(_recommendationIndex, _recommendations),
      SizedBox(height: 20,),
      backButton,
      ],
    );
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Recommedation For You'),
          ),
          body: Align(
            alignment: Alignment(-1.0, -1.0),
            child: Container(
              //width: MediaQuery.of(context).size.width,
              //color: Colors.white,
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _dateText,
                        !_hasSelected? _overviewWidgets : _detailWidgets,
                        //Navigation bar
                        
                      ],
                    ),
                  )),
            ),
          )),
    );
  }
}

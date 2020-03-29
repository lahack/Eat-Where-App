import 'dart:async';

import 'package:eat_where/utils/auth_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:eat_where/pages/group_page.dart';
import 'package:eat_where/pages/home_page.dart';
import 'package:eat_where/pages/login_page.dart';
import 'package:eat_where/pages/me_page.dart';
import 'package:eat_where/utils/color_util.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = FlutterSecureStorage();
  String email = await storage.read(key: "email");
  String password = await storage.read(key: "password");

  // TODO: Authenticate with Firebase
//  var auth = Auth();
//  String currentUserId = await auth.signIn(email, password);
  if (email == null || password == null) {
    runApp(App(false, ""));
    return;
  }

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)
      .then((currentUser) {
        runApp(App(true, currentUser.user.uid));
  }).catchError((error) => runApp(App(false, "")));

//  runApp(App(false, ""));
}

/*
  Entry point of the entire app.
 */
class App extends StatelessWidget {
  App(this.hasValidated, this.currentUserId);

  final bool hasValidated;
  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eat Where',
      theme: ThemeData(
        primarySwatch: ColorUtils.themeColor,
      ),
      // If user is logged in, direct to Home. Otherwise, show the LoginPage.
      home: hasValidated ? Home(currentUserId) : LoginPage(),
    );
  }
}

/*
  Home screen that manages three tabs.
 */
class Home extends StatefulWidget {
  final String currentUserId;

  Home(this.currentUserId);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _pages;
  final _pageTitles = <String>["Recommendation for you", "Groups", "Profile"];
  final _tabIcons = <IconData>[Icons.home, Icons.group, Icons.account_circle];
  final _tabTitles = <Text>[Text("Home"), Text("Groups"), Text("Me")];

  int _tabIndex;

  @override
  void initState() {
    super.initState();
    _tabIndex = 0;
    _pages = <Widget>[
      HomePage(),
      GroupPage("a2Ld6Y1JSohBif93tfIT"),   // TODO: DEBUG
      MePage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    var bodyStack = IndexedStack(
      children: _pages,
      index: _tabIndex,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _pageTitles[_tabIndex],
          style: TextStyle(color: ColorUtils.lightColor),
        ),
      ),
      body: bodyStack,
//      body: StreamBuilder<QuerySnapshot>(
//        stream: Firestore.instance.collection('users').snapshots(),
//        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//          if (snapshot.hasError)
//            return new Text('Error: ${snapshot.error}');
//          switch (snapshot.connectionState) {
//            case ConnectionState.waiting: return new Text('Loading...');
//            default:
//              return new ListView(
//                children: snapshot.data.documents.map((DocumentSnapshot document) {
//                  return new ListTile(
//                    title: new Text(document['preference']['spicy_level'].toString()),
//                    subtitle: new Text("success"),
//                  );
//                }).toList(),
//              );
//          }
//        },
//      ),
      bottomNavigationBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(_tabIcons[0]),
            title: _tabTitles[0],
          ),
          BottomNavigationBarItem(
            icon: Icon(_tabIcons[1]),
            title: _tabTitles[1],
          ),
          BottomNavigationBarItem(
            icon: Icon(_tabIcons[2]),
            title: _tabTitles[2],
          )
        ],
        currentIndex: _tabIndex,
        onTap: (index) {
          setState((){
            _tabIndex = index;
          });
        },
      ),
    );
  }
}

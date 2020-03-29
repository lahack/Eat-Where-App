import 'dart:async';

import './pages/group_page.dart';
import './pages/home_page.dart';
import './pages/login_page.dart';
import './pages/me_page.dart';
import './utils/color_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = FlutterSecureStorage();
  String username = await storage.read(key: "username");
  String password = await storage.read(key: "password");

  // TODO: Authenticate with Firebase
  runApp(App(false));
}

/*
  Entry point of the entire app.
 */
class App extends StatelessWidget {
  App(this.hasValidated);

  final bool hasValidated;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eat Where',
      theme: ThemeData(
        primarySwatch: ColorUtils.themeColor,
      ),
      // If user is logged in, direct to Home. Otherwise, show the LoginPage.
      home: hasValidated ? Home() : LoginPage(),
    );
  }
}

/*
  Home screen that manages three tabs.
 */
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _pages = <Widget>[HomePage(), GroupPage(), MePage()];
  final _pageTitles = <String>["Recommendation for you", "Groups", "Profile"];
  final _tabIcons = <IconData>[Icons.home, Icons.group, Icons.account_circle];
  final _tabTitles = <Text>[Text("Home"), Text("Groups"), Text("Me")];

  int _tabIndex;

  @override
  void initState() {
    super.initState();
    _tabIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    var bodyStack = IndexedStack(
      children: _pages,
      index: _tabIndex,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pageTitles[_tabIndex],
          style: TextStyle(color: ColorUtils.lightColor),
        ),
      ),
      body: bodyStack,
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

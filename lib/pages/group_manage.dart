import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'group_invite.dart';

class GroupManage extends StatefulWidget {
  @override
  _GroupManageState createState() => _GroupManageState();
}

class _GroupManageState extends State<GroupManage> {
  final _groups = <String>["Friday party", "Office lunch"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Manage Group',
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add, color: Colors.white),
              onPressed: () {
                //TODO:Jump to Friend list but with a radio button
              },
            ),
          ],
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 20.0,
                ),
                child: Text("Who's Coming",
                    style: TextStyle(fontSize: 20), textAlign: TextAlign.left),
              ),
              GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 10,
                  shrinkWrap: true,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
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
                    Column(
                      mainAxisSize: MainAxisSize.min,
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
                          child: Text("Young Thug", textScaleFactor: 1.3),
                        ),
                      ],
                    ),
                  ]),
              Divider(),
            ]));
  }
}

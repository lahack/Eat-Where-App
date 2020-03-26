import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
  Asks user to input group name and pick a date (or range).
  Displays a text field and a date picker.
 */
class AddGroupPage extends StatefulWidget {
  @override
  _AddGroupPageState createState() => _AddGroupPageState();
}

class _AddGroupPageState extends State<AddGroupPage> {

  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create a group"),
        centerTitle: true,
        titleSpacing: 0,
        actions: <Widget>[
          MaterialButton(
            child: Text("Done",
              style: TextStyle(fontSize: 18),
            ),
            onPressed: () {
              // TODO: validate input and send data to chat page
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  labelText: "Group Name"
              ),
            ),
            // TODO: date picker
          ],
        ),
      )
    );
  }
}
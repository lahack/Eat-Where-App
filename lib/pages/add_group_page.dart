<<<<<<< HEAD
<<<<<<< HEAD
import 'package:eat_where/pages/group_manage.dart';
=======
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_where/pages/chat_page.dart';
import 'package:eat_where/pages/group_page.dart';
import 'package:eat_where/utils/color_util.dart';
>>>>>>> finished add page
=======
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_where/pages/chat_page.dart';
import 'package:eat_where/utils/color_util.dart';
>>>>>>> finished add page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

/*
  Asks user to input group name and pick a date (or range).
  Displays a text field and a date picker.
 */
class AddGroupPage extends StatefulWidget {

  final String currentUserId;

  AddGroupPage(this.currentUserId);

  @override
  _AddGroupPageState createState() => _AddGroupPageState();
}

class _AddGroupPageState extends State<AddGroupPage> {

  TextEditingController _controller;
  DateTime _initialDate;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _initialDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.currentUserId);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: ColorUtils.lightColor
        ),
        title: Text("Create a group",
          style: TextStyle(color: ColorUtils.lightColor),
        ),
        centerTitle: true,
        titleSpacing: 0,
        actions: <Widget>[
          MaterialButton(
            child: Text("Done",
              style: TextStyle(fontSize: 18, color: ColorUtils.lightColor),
            ),
<<<<<<< HEAD
<<<<<<< HEAD
            onPressed: () {
              // TODO: validate input and send data to chat page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GroupManage()),
              );
=======
=======
>>>>>>> finished add page
            onPressed: () async {
              print("Done button pressed");
              // TODO: publish to firebase
              String name = _controller.text;
              if (name != null && name.length > 0) {
                var ref = await Firestore.instance.collection('groups').add({
                  'date' : Timestamp.fromDate(_initialDate),
                  'name' : name,
                  'owner' : widget.currentUserId,
                  'members' : [widget.currentUserId]
                });
                Firestore.instance.collection('users')
                    .document(widget.currentUserId)
                    .updateData({'groups': FieldValue.arrayUnion(
                    [{'id': ref.documentID, 'owner': true}])});
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(
                        builder: (context) =>
<<<<<<< HEAD
//                            ChatPage(widget.currentUserId, ref.documentID)
                              Home(widget.currentUserId, 1)
                    ),
                        (Route<dynamic> route) => false
                );
              }
>>>>>>> finished add page
=======
                            ChatPage(widget.currentUserId, ref.documentID)),
                        (Route<dynamic> route) => false
                );
              }
>>>>>>> finished add page
            },
          )
        ],
      ),
      resizeToAvoidBottomPadding: false,
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
            SizedBox(height: 20),
            Text("Date and time",
              style: TextStyle(fontSize: 13),
            ),
            Container(
              height: 120,
//                  width: 200,
              child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (dateTime) {
                  setState(() {
                    _initialDate = dateTime;
                  });
                },
              ),
            ),
          ],
        ),
      )
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
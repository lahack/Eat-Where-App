import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_where/pages/add_group_page.dart';
import 'package:eat_where/utils/color_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
  Group tab.

  Contains a ListView of all group info and a floating button
  Uses a Scaffold to structure them.
 */
class GroupPage extends StatefulWidget {
  final String currentUserId;

  GroupPage(this.currentUserId);

  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  final _groups = <String>["Friday party", "Office lunch"];

  @override
  void initState() {
    super.initState();
    Firestore.instance
        .collection("users")
        .document(widget.currentUserId)
        .get().then((value) {
          value.data
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddGroupPage();
          }));
        },
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('users')
            .document(widget.currentUserId)
            .collection('groups')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return new Text('Loading...');
          return new ListView(
            children: snapshot.data.documents.map((DocumentSnapshot document) {
              return new ListTile(
                title: new Text(document['id']),
                subtitle: new Text(document['owner'] ? "Owner" : "Non - owner"),
              );
            }).toList(),
          );
        },
      )
//      body: Container(
//        margin: EdgeInsets.all(20),
//        child: ListView.builder(
//          itemCount: _groups.length,
//          itemBuilder: (BuildContext ctx, int index) {
//            return InkWell(
//              child: Container(
//                padding: EdgeInsets.all(20),
//                margin: EdgeInsets.all(5),
//                height: 80,
//                decoration: BoxDecoration(
//                  border: Border.all(color: ColorUtils.borderColor),
//                  borderRadius: BorderRadius.all(Radius.circular(10)),
//                ),
//                child: Text(_groups[index]),
//              ),
//              onTap: () {
//                print(index);
//                // TODO: page transition
//              },
//            );
//          },
//        ),
//      )
    );
  }
}
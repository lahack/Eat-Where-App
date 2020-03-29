import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_where/pages/add_group_page.dart';
import 'package:eat_where/pages/chat_page.dart';
import 'package:eat_where/utils/color_util.dart';
import 'package:eat_where/utils/time_util.dart';
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
//  final _groups = <String>["Friday party", "Office lunch"];
  List<Group> _groups = [];

  @override
  void initState() {
    super.initState();

    Firestore.instance
        .collection('users')
        .document(widget.currentUserId)
        .snapshots()
        .listen((documentSnapshot) {
            List<dynamic> groupIdList = documentSnapshot.data['groups'];
            _groups = [];

            for (int i = 0; i < groupIdList.length; i++) {
              Firestore.instance.collection('groups').document(groupIdList[i]['id']).get().then((ds) {
                setState(() {
                  _groups.add(Group.fromSnapshot(ds, widget.currentUserId, ds.documentID));
                });


                print(_groups[0].name);
              });
            }

//          setState(() {
//            for (var groupMap in documentSnapshot.data['groups']) {
//              _groups.add(Group.fromMap(groupMap, widget.currentUserId));
//            }
//          });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddGroupPage(widget.currentUserId);
          }));
        },
      ),
      body: Container(
        margin: EdgeInsets.all(20),
//        child: _buildBody(context),
        child: ListView.builder(
          itemCount: _groups.length,
          itemBuilder: (BuildContext ctx, int index) {
            return InkWell(
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(5),
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      blurRadius: 2, // has the effect of softening the shadow
                      spreadRadius: 2, // has the effect of extending the shadow
                      offset: Offset(
                        1, // horizontal, move right 10
                        2, // vertical, move down 10
                      ),
                    )
                  ],
                  border: Border.all(color: ColorUtils.borderColor),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(_groups[index].name,
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                        Text(TimeUtils.minuteFormat(_groups[index].date))
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    _groups[index].isOwner ?
                    Container(
                      padding: EdgeInsets.all(5),
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorUtils.borderColor),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text("Owner"),
                    ) : Container(height: 30,),
                    Container(
                      margin: EdgeInsets.all(5),
                      height: 40,
                      width: 40,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.person),
                          Text(_groups[index].members.length.toString())
                        ],
                      ),
                    )
                  ],
                ),
              ),
              onTap: () {
                print(index);
                // TODO: page transition
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(widget.currentUserId, _groups[index].id)));
              },
            );
          },
        ),
      )
    );
  }
}

/*
  Data for one group
 */
class Group {
  String name;
  DateTime date;
  bool isOwner;
  List<dynamic> members;
  final DocumentReference reference;
  String id;

  Group.fromMap(Map<dynamic, dynamic> map, String currentUserId, DocumentReference reference, String documentId)
    : name = map['name'],
      date = map['date'].toDate(),
      isOwner = (map['owner'] == currentUserId),
      members = map['members'],
      reference = reference,
      id = documentId;

  Group.fromSnapshot(DocumentSnapshot snapshot, String currentUserId, String documentId)
      : this.fromMap(snapshot.data, currentUserId, snapshot.reference, documentId);

}
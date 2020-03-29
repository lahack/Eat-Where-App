import 'package:cloud_firestore/cloud_firestore.dart';
<<<<<<< HEAD
import 'package:eat_where/utils/color_util.dart';
=======
>>>>>>> finished add page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
  Chat room page
 */
class ChatPage extends StatefulWidget {
  final String currentUserId;
  final String currentGroupId;

  ChatPage(this.currentUserId, this.currentGroupId);

  @override
  State<StatefulWidget> createState() => _ChatPageState();
}

<<<<<<< HEAD
class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
=======
class _ChatPageState extends State<ChatPage> {
>>>>>>> finished add page

  List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;
<<<<<<< HEAD
  String _groupName = "";
  int _stage = 0;
  String _dropDownValue = "Date";
=======
>>>>>>> finished add page

  @override
  void initState() {
    super.initState();
    Firestore.instance
        .collection('groups')
        .document(widget.currentGroupId)
        .snapshots()
        .listen((documentSnapshot) {
          _messages = [];
          List<dynamic> messageList = documentSnapshot.data['messages'];
<<<<<<< HEAD

          setState(() {
            _groupName = documentSnapshot.data['name'];
            _stage = documentSnapshot.data['stage'];
          });

          if (messageList != null) {
            for (int i = 0; i < messageList.length; i++) {
              String userId = messageList[i]['userId'];
              String text = messageList[i]['text'];
              var ref = Firestore.instance.collection('users')
                  .document(userId)
                  .get()
                  .then((ds) {
                String name = ds.data['name'];
                ChatMessage message = ChatMessage(name: name, text: text, isCurrentUser: userId == widget.currentUserId);
                setState(() {
                  _messages.insert(0, message);
                });
              });
            }
=======
          for (int i = 0; i < messageList.length; i++) {
            String userId = messageList[i]['userId'];
            String text = messageList[i]['text'];
            var ref = Firestore.instance.collection('users').document(userId).get().then((ds) {
              String name = ds.data['name'];
              ChatMessage message = ChatMessage(name: name, text: text,
                  animationController: AnimationController(
                    duration: Duration(milliseconds: 700),
                  ));
              setState(() {
                _messages.insert(0, message);
              });
              message.animationController.forward();
            });
>>>>>>> finished add page
          }
//      List<dynamic> groupIdList = documentSnapshot.data['groups'];
//      _groups = [];
//
//      for (int i = 0; i < groupIdList.length; i++) {
//        Firestore.instance.collection('groups').document(groupIdList[i]['id']).get().then((ds) {
//          setState(() {
//            _groups.add(Group.fromSnapshot(ds, widget.currentUserId));
//          });
//
//
//          print(_groups[0].name);
//        });
//      }
    });
  }

  void _handleSubmitted(String text) {
<<<<<<< HEAD
    if (text == null || text.length == 0) {
      return;
    }
=======
>>>>>>> finished add page
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    Firestore.instance.collection('groups')
        .document(widget.currentGroupId)
        .updateData({'messages': FieldValue.arrayUnion(
<<<<<<< HEAD
        [{
          'text': text,
          'userId': widget.currentUserId,
          "time": Timestamp.fromDate(DateTime.now())
          }
         ]
    )});
=======
        [{'text': text, 'userId': widget.currentUserId}])});
>>>>>>> finished add page
//    ChatMessage message = ChatMessage(
//      name: "Me",
//      text: text,
//      animationController: AnimationController(
//        duration: Duration(milliseconds: 700),
//      ),
//    );
//    setState(() {
//      _messages.insert(0, message);
//    });
//    message.animationController.forward();
  }

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                onSubmitted: _handleSubmitted,
                decoration:
                new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
                margin: new EdgeInsets.symmetric(horizontal: 4.0),
                child: Theme.of(context).platform == TargetPlatform.iOS
                    ? new CupertinoButton(
                  child: new Text("Send"),
                  onPressed: _isComposing
                      ? () => _handleSubmitted(_textController.text)
                      : null,
                )
                    : new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: _isComposing
                      ? () => _handleSubmitted(_textController.text)
                      : null,
                )),
          ]),
          decoration: Theme.of(context).platform == TargetPlatform.iOS
              ? new BoxDecoration(
              border:
              new Border(top: new BorderSide(color: Colors.grey[200])))
              : null),
    );
  }

  @override
  Widget build(BuildContext context) {

<<<<<<< HEAD
    Widget childWidget = Text("Error");

    if (_stage == 0) {
      childWidget = Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Purpose:",
                  style: TextStyle(fontSize: 20),
                ),
                DropdownButton<String>(
                  value: _dropDownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (String newValue) {
                    setState(() {
                      _dropDownValue = newValue;
                    });
                  },
                  items: <String>['Date', 'Business', 'Casual', 'Family']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Container(
            width: 230,
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(30.0),
              color: ColorUtils.themeColor,
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                onPressed: () {
                  // TODO: Call api
                  setState(() {
                    _stage++;
                  });
                },
                child: Text("Start Matching!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: ColorUtils.lightColor)),
              ),
            ),
          )
        ],
      );
    }
    else if (_stage == 1) {
      childWidget = 
    }

    return Scaffold(
      appBar: new AppBar(
          title: new Text(_groupName,
            style: TextStyle(color: ColorUtils.lightColor),
          ),
          elevation:
          Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0
      ),
      body: new SafeArea(
          child: new Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 300,
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
                  child: childWidget,
                ),
=======
    return Scaffold(
      appBar: new AppBar(
          title: new Text("Friendlychat"),
          elevation:
          Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0
      ),
      body: new Container(
          child: new Column(
              children: <Widget>[
>>>>>>> finished add page
                new Flexible(
                    child: new ListView.builder(
                      padding: new EdgeInsets.all(8.0),
                      reverse: true,
                      itemBuilder: (_, int index) => _messages[index],
                      itemCount: _messages.length,
                    )
                ),
                new Divider(height: 1.0),
                new Container(
                  decoration: new BoxDecoration(
                      color: Theme.of(context).cardColor),
                  child: _buildTextComposer(),
                ),
              ]
          ),
<<<<<<< HEAD
      ),
=======
          decoration: Theme.of(context).platform == TargetPlatform.iOS ? new BoxDecoration(border: new Border(top: new BorderSide(color: Colors.grey[200]))) : null),//new
>>>>>>> finished add page
    );
  }

  @override
  void dispose() {
<<<<<<< HEAD
=======
    for (ChatMessage message in _messages)
      message.animationController.dispose();
>>>>>>> finished add page
    super.dispose();
  }
}

class ChatMessage extends StatelessWidget {
<<<<<<< HEAD
  ChatMessage({this.name, this.text, this.isCurrentUser});
  final String name;
  final String text;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: !isCurrentUser ? Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(child: new Text(name, style: TextStyle(fontSize: 10),)),
            ),
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: new Text(text),
                  ),
                ],
              ),
            ),
          ],
        ) : Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: new Text(text),
                  ),
                ],
              ),
            ),
            new Container(
              margin: const EdgeInsets.only(left: 16.0),
              child: new CircleAvatar(child: new Text(name, style: TextStyle(fontSize: 10),)),
            ),
          ],
        ),
=======
  ChatMessage({this.name, this.text, this.animationController});
  final String name;
  final String text;
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
        sizeFactor: new CurvedAnimation(
            parent: animationController,
            curve: Curves.easeOut
        ),
        axisAlignment: 0.0,
        child: new Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(right: 16.0),
                child: new CircleAvatar(child: new Text(name)),
              ),
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(name, style: Theme.of(context).textTheme.subhead),
                    new Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: new Text(text),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
>>>>>>> finished add page
    );
  }
}
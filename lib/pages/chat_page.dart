import 'package:cloud_firestore/cloud_firestore.dart';
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

class _ChatPageState extends State<ChatPage> {

  List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;

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
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    Firestore.instance.collection('groups')
        .document(widget.currentGroupId)
        .updateData({'messages': FieldValue.arrayUnion(
        [{'text': text, 'userId': widget.currentUserId}])});
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

    return Scaffold(
      appBar: new AppBar(
          title: new Text("Friendlychat"),
          elevation:
          Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0
      ),
      body: new Container(
          child: new Column(
              children: <Widget>[
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
          decoration: Theme.of(context).platform == TargetPlatform.iOS ? new BoxDecoration(border: new Border(top: new BorderSide(color: Colors.grey[200]))) : null),//new
    );
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }
}

class ChatMessage extends StatelessWidget {
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
    );
  }
}
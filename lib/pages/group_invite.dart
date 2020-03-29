import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupInvite extends StatefulWidget {
  @override
  _GroupInviteState createState() => _GroupInviteState();
}

class _GroupInviteState extends State<GroupInvite> {
  final _groups = <String>["Friday party", "Office lunch"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invite')
      ),
      body:Text("Create a group"),
    );
  }
}
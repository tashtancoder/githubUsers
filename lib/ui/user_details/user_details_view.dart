import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserDetailsView extends StatefulWidget {
  final String userName;
  UserDetailsView({required this.userName});
  @override
  UserDetailsWidgetState createState() {
    // TODO: implement createState
    return UserDetailsWidgetState();
  }

}

class UserDetailsWidgetState extends State<UserDetailsView> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userName),
      ),
      body: Center(
        child: Text(widget.userName),
      ),
    );
  }

}
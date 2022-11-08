import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  final String userName;
  const UserDetailsPage({super.key, required this.userName});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.userName
        ),
      ),
    );
  }

}
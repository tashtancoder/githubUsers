 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/User.dart';

class UserItmView extends StatelessWidget {
  final User userItm;
  final Function(String) onTap;
  UserItmView({required this.userItm, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: Hero(
        tag: userItm.userName,
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              userItm.avatarUrl
          ),
        ),
      ),
      title: Text(userItm.userName),
      subtitle: Text(userItm.type),
      trailing: Icon(Icons.chevron_right),
      onTap: (){
        onTap(userItm.userName);
      },
    );
  }

}
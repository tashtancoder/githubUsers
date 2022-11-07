import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:githubUsers/repos/api_provider.dart';
import 'package:githubUsers/ui/user_details/user_details_view.dart';
import 'package:githubUsers/ui/user_list/user_item_view.dart';

import '../../models/User.dart';

class UserListView extends StatefulWidget {
  @override
  UserListViewState createState() {
    // TODO: implement createState
    return UserListViewState();
  }

}

class UserListViewState extends State<UserListView> {

  List<User> userList = [];

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      getUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Github Users'
        ),
      ),
      body: ListView.separated(
          padding: EdgeInsets.only(left: 10, top: 15, right: 10),
          shrinkWrap: true,
          itemBuilder: (BuildContext ctxt, int index){
            return UserItmView(
                userItm: userList[index],
                onTap: onListileTap,
            );
            /*return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  userList[index].avatarUrl
                ),
              ),
              title: Text(userList[index].userName),
            );*/
          },
          separatorBuilder: (ctxt, index){
            return Divider();
          },
          itemCount: userList.length
      )
    );
  }

  onListileTap(String userName){
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) {
              return UserDetailsView(userName: userName);
            }
    ));

  }

  getUsers() async {
    final ApiProvider apiProvider = ApiProvider();
    userList = await apiProvider.fetchUserList(1);
    print(userList.length);
    setState(() {

    });
  }

}
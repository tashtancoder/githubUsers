import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubUsers/blocs/user_list_bloc/user_list_bloc.dart';
import 'package:githubUsers/blocs/user_list_bloc/user_list_event.dart';
import 'package:githubUsers/blocs/user_list_bloc/user_list_state.dart';
import 'package:githubUsers/constants/colors.dart';
import 'package:githubUsers/repos/api_provider.dart';
import 'package:githubUsers/ui/pages/user_details_page.dart';
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
  final _scrollController = ScrollController();
  //List<User> userList = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      //print(_isEnd());
      if (_isEnd()){
        print('isEnd');
        context.read<UserListBloc>().add(GetUserList());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Build Method');
    // TODO: implement build
    return BlocBuilder<UserListBloc, UserListState>(
      builder: (context, state) {
        print('User List Builder');
        //if (state is UserListInitial || state is UserListLoading) {
        if (state is UserListInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserListLoaded) { // Show userList if loaded
            return _listViewBuild(state.userList, state.isEndOfList);
          } else if (state is UserListLoading) {
            return _listViewBuild(state.userList, false);
          } else {
            return Center(
              child: Text(
                (state as UserListError).msg,
              ),
            );
          }

      },
    );
  }

  bool _isEnd(){
    if (!_scrollController.hasClients) {
      return false;
    }
    final maxScroll = _scrollController.position.maxScrollExtent;
    return _scrollController.offset >= maxScroll * 0.9;
  }

  Widget _listViewBuild(List<User> userList, bool isEndOfList){
    print('User List Size ${userList.length}');
    return ListView.separated(
        padding: const EdgeInsets.only(left: 10, top: 15, right: 10),
        shrinkWrap: true,
        itemBuilder: (BuildContext ctxt, int index){
           return index < userList.length ? UserItmView(
            userItm: userList[index],
            onTap: onListileTap,
          ) : const Center(
             child: SizedBox(
               height: 24,
               width: 24,
               child: CircularProgressIndicator(strokeWidth: 1.5),
             ),
           );
        },
        separatorBuilder: (ctxt, index){
          return Divider(color: profileBackgroundColor,);
        },

        // make itemCount userList+1 if all Github Users are not fetched yet
        itemCount: isEndOfList ? userList.length : userList.length + 1,
        controller: _scrollController,
    );
  }

  onListileTap(String userName){
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) {
              return UserDetailsPage(userName: userName);
            }
    ));

  }

  /*getUsers() async {
    final ApiProvider apiProvider = ApiProvider();
    userList = await apiProvider.fetchUserList(1);
    print(userList.length);
    setState(() {

    });
  } */

}
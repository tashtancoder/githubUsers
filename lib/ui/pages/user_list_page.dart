import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubUsers/ui/user_list/user_list_view.dart';

import '../../blocs/user_list_bloc/user_list_bloc.dart';
import '../../blocs/user_list_bloc/user_list_event.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'Github Users'
          ),
        ),
        body: BlocProvider(
          create: (_) => UserListBloc()..add(GetUserList()),
          //create: (_) => _userListBloc,
          child: UserListView(),


        )
    );
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubUsers/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:githubUsers/blocs/user_details_bloc/user_details_event.dart';
import 'package:githubUsers/ui/user_details/user_details_view.dart';

import '../../constants/colors.dart';

class UserDetailsPage extends StatelessWidget {
  final String userName;
  const UserDetailsPage({super.key, required this.userName});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: profileBackgroundColor,
        iconTheme: IconThemeData(
          color: Colors.black54
        ),
        title: Text(
          userName,
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w700
          ),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (_) => UserDetailsBloc()..add(GetUserDetails(userName)),
        child: UserDetailsView(),
      ),
    );
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubUsers/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:githubUsers/blocs/user_details_bloc/user_details_event.dart';
import 'package:githubUsers/blocs/user_details_bloc/user_details_state.dart';

class UserDetailsView extends StatefulWidget {
  //final String userName;
  UserDetailsView();
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
    return BlocBuilder<UserDetailsBloc, UserDetailsState>(
      builder: (context, state) {
        if (state is UserDetailsInitial || state is UserDetailsLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserDetailsLoaded){
          return Center(
            child: Text(
              state.userDetails.email
            ),
          );
        } else {
          return Center(
            child: Text((state as UserDetailsError).msg),
          );
        }
      },
    );
  }

}
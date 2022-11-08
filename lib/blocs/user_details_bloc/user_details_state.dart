import 'package:equatable/equatable.dart';

import '../../models/user_detail.dart';


abstract class UserDetailsState extends Equatable {
  const UserDetailsState();

  @override
  List<Object> get props {
    return [];
  }
}

class UserDetailsInitial extends UserDetailsState {

}

class UserDetailsLoading extends UserDetailsState {}

class UserDetailsLoaded extends UserDetailsState {
  final UserDetails userDetails;
  UserDetailsLoaded({required this.userDetails});

  @override
  List<Object> get props {
    return [userDetails];
  }
}

class UserDetailsError extends UserDetailsState {
  final String msg;
  const UserDetailsError(this.msg);
}
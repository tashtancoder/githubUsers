import 'package:equatable/equatable.dart';

import '../../models/User.dart';

abstract class UserListState extends Equatable {
  const UserListState();

  @override
  List<Object> get props {
    return [];
  }
}

class UserListInitial extends UserListState {}

class UserListLoading extends UserListState {
  final List<User> userList;
  const UserListLoading(this.userList);
  @override
  List<Object> get props {
    return [userList];
  }
}

class UserListLoaded extends UserListState {
  final List<User> userList;
  const UserListLoaded(this.userList);

  @override
  List<Object> get props {
    return [userList];
  }
}

class UserListError extends UserListState {
  final String msg;
  const UserListError(this.msg);
}
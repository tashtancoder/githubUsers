import 'package:equatable/equatable.dart';

abstract class UserListEvent extends Equatable {
  const UserListEvent();

  @override
  List<Object> get props {
    return [];
  }
}

class GetUserList extends UserListEvent {}
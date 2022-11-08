import 'package:equatable/equatable.dart';

abstract class UserDetailsEvent extends Equatable {
  const UserDetailsEvent();

  @override
  List<Object> get props {
    return [];
  }
}

class GetUserDetails extends UserDetailsEvent {
  final String userName;
  const GetUserDetails(this.userName);
}
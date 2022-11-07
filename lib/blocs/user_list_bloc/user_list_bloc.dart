import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubUsers/blocs/user_list_bloc/user_list_event.dart';
import 'package:githubUsers/blocs/user_list_bloc/user_list_state.dart';
import 'package:githubUsers/repos/api_repo.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  UserListBloc() : super(UserListInitial()) {
    final ApiRepo _apiRepo = ApiRepo();
    on<GetUserList>((event, emit) async {
      try {
        emit(UserListLoading());
        final userList = await _apiRepo.fetchUserList(1);
        emit(UserListLoaded(userList));
        if (userList == null) {
          emit(UserListError('Error during userList fetch data'));
        }

      } on Exception {
        emit(UserListError('Error in network'));
      }
    });

  }

}
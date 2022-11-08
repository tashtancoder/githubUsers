import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubUsers/blocs/user_list_bloc/user_list_event.dart';
import 'package:githubUsers/blocs/user_list_bloc/user_list_state.dart';
import 'package:githubUsers/repos/api_repo.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../models/User.dart';

const throttleTime = Duration(milliseconds: 90);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper){
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  int sinceId = 0;
  bool isAllFetched = false;
  List<User> userList = <User>[];
  final ApiRepo _apiRepo = ApiRepo();
  UserListBloc() : super(UserListInitial()) {
    /*on<GetUserList>(
        _fetchOnEvent,
        transformer: throttleDroppable(throttleTime)
    ); */

    on<GetUserList>(
            (event, emit) => _fetchOnEvent(event, emit),
            transformer: throttleDroppable(throttleTime)
    );
  }

  Future<void> _fetchOnEvent(UserListEvent event, Emitter<UserListState> emit) async {
    if (isAllFetched) {
      return;
    }
    try {
      print('SinceId ${sinceId}');
      emit(UserListLoading(userList));
      final userListForPage = await _apiRepo.fetchUserList(sinceId);
      isAllFetched = userListForPage.isEmpty;
      userList.addAll(userListForPage);
      sinceId = userList.last.id;
      print('UserListSize ${userList.length}');
      //await Future<void>.delayed(const Duration(milliseconds: 100));
      emit(UserListLoaded(userList));
    } on Exception catch (error) {
      print(error);
      emit(UserListError('Error in network'));
    }
  }

}
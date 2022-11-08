import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubUsers/blocs/user_details_bloc/user_details_event.dart';
import 'package:githubUsers/blocs/user_details_bloc/user_details_state.dart';

import '../../repos/api_repo.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  final ApiRepo _apiRepo = ApiRepo();
  UserDetailsBloc() : super(UserDetailsInitial()){
    on<GetUserDetails>((event, emit) => _getUserDetails(event, emit));
  }

  Future<void> _getUserDetails(event, emit) async{
    try {
      emit(UserDetailsLoading());
      final userDetails = await _apiRepo.fetchUserDetails((event as GetUserDetails).userName);
      emit(UserDetailsLoaded(userDetails: userDetails));

    } on Exception catch (error) {
      emit(UserDetailsError('Network error'));

    }
  }

}
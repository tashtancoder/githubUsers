import 'package:githubUsers/models/User.dart';
import 'package:githubUsers/repos/api_provider.dart';

import '../models/user_detail.dart';

class ApiRepo {
  final _apiProvider = ApiProvider();
  Future<List<User>> fetchUserList(int page){
    return _apiProvider.fetchUserList(page);
  }

  Future<UserDetails> fetchUserDetails(String userName){
    return _apiProvider.fetchUserDetails(userName);
  }
}
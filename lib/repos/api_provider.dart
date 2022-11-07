import 'dart:convert';

import 'package:githubUsers/constants/endpoints.dart';
import 'package:githubUsers/models/User.dart';
import 'package:http/http.dart';

import '../models/user_detail.dart';

class ApiProvider{
  Future<List<User>> fetchUserList(int page) async {
    final res = await get(Uri.parse(getUsersEndpoint + '?page=${page}'));
    if (res.statusCode == 200) {
      final List<dynamic> userListData = jsonDecode(res.body);
      return userListData.map((userData) => User.fromMap(userData)).toList();
    } else {
      throw Exception('Error during userList Data on page ${page}');

    }
  }
  
  Future<UserDetails> fetchUserDetails(String userName)async {
    final res = await get(Uri.parse(getUsersEndpoint + '/${userName}'));
    if (res.statusCode == 200) {
      final dynamic userDetailsData = jsonDecode(res.body);
      return UserDetails.fromMap(userDetailsData);
    } else {
      throw Exception("Error during data fetch with username ${userName}");
    }
  }

}
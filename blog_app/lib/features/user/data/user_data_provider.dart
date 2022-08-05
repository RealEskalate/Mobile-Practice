import 'dart:convert';

import 'package:blog_app/core/http_client.dart';
import 'package:blog_app/features/user/domain/entities/user.dart';
import 'package:dio/dio.dart';

class UserProvider {
  final dio = createDio();

  void getUserModel() async {
    try {
      // _clien.dio.get(path)
      final dio = createDio();
      var response = await dio.get('/user');
      print(response.data);
    } catch (e) {
      print("object");
    }
  }

  Future<User> getCurrentUser() async {
    String url = "/user";

    var response = await dio.get(url);
    return User.fromJson(jsonDecode(response.data));
  }

  Future<List<User>> getAllUser() async {
    String url = "/user/all";
    var usersResponse = await dio.get(url);
    List<dynamic> usersBody = jsonDecode(usersResponse.data);
    return usersBody.map((userMap) => User.fromJson(userMap)).toList();
  }
}

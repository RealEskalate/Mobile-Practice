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
    return response.data;
  }

  Future<List<User>> getAllUser() async {
    String url = "/user/all";
    Response<String> usersResponse = await dio.get(url);
    List<dynamic> cp = jsonDecode(usersResponse.data!);
    return cp.map((userMap) => User.fromJson(userMap)).toList();
  }
}

import 'dart:convert';
import 'package:blog_app/core/http_client.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:blog_app/core/secure_storage.dart';

class AuthDataProvider {
  final _baseURL = "https://blog-app-backend.onrender.com";
  final http.Client httpClient;
  SecureStorage _secureStorage = SecureStorage();
  AuthDataProvider({required this.httpClient});

  // Future<bool> signUp(
  //     {required String fullName,
  //     required String email,
  //     required String password}) async {
  //   var body = jsonEncode(<String, dynamic>{
  //     "email": email,
  //     "password": password,
  //     "fullName": fullName,
  //   });
  //   return true;
  //   // Response<String> response = await createDio().post("/user", data: body);
  //   // if (response.statusCode == 201) {
  //   //   return true;
  //   // } else {
  //   //   throw Exception(jsonDecode(response.data!)['body']);
  //   // }
  // }

  Future<bool> signUp(
      {required String fullName,
      required String email,
      required String password}) async {
    final response = await httpClient.post(
      Uri.parse('$_baseURL/api/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control_Allow_Origin": "*",
        "Access-Control-Allow-Credentials": "true"
      },
      body: jsonEncode(<String, dynamic>{
        "email": email,
        "password": password,
        "fullName": fullName,
      }),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception(jsonDecode(response.body)['body']);
    }
  }

  Future<String> signIn(
      {required String email, required String password}) async {
    final response = await httpClient.post(
      Uri.parse('$_baseURL/api/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{"email": email, "password": password}),
    );
    if (response.statusCode == 201) {
      return response.body;
    } else {
      throw Exception('Failed to login user');
    }
  }
}

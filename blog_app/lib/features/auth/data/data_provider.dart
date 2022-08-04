import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthDataProvider {
  final _baseURL = "https://blog-app-backend.onrender.com";
  final http.Client httpClient;

  AuthDataProvider({required this.httpClient});

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
      body: jsonEncode(<String, dynamic>{
        "email": email, 
        "password": password}),
    );
    if (response.statusCode == 201) {
      
      return response.body;
    } else {
      throw Exception('Failed to login user');
    }
  }

}

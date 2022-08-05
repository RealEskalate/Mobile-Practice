import 'dart:convert';



import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../models/article.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://62ea1d5a3a5f1572e8746068.mockapi.io/Articles/';

  void getAllArticles() async {
    try {
      final response = await _dio.get(_url);
      print(response);
    } catch (error) {
      print(error);
    }
  }

  Future<Article> getArticleById(String articleId) async {
    try {
      final response = await _dio.get(_url + "/${articleId}");
      return Article.fromJson(response.data);
    } catch (error, stacktrace) {
      print("= = = = = = = = ================== = = = = = =");
      print(error);
      print(stacktrace);
      throw Exception("An Error Occurred while fetching artlces.");
    }
  }
}

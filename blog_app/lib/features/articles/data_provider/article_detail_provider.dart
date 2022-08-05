import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/article.dart';

//

class ArticleDetailProvider {
  final _baseUrl = 'http://192.168.56.1:3000';
  final http.Client httpClient;

  ArticleDetailProvider({required this.httpClient});

  Future<Article> getArticleDetail(String id) async {
    final response = await httpClient.get(
      Uri.http('192.168.56.1:3000', '/article/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

    );

    if (response.statusCode == 200) {
      return Article.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create course.');
    }
  }
}

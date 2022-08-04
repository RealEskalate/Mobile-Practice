
import 'package:http/http.dart' as http;

import '../models/article.dart';
import 'article_provider_interface.dart';

class ArticleProvider implements ArticleProviderInterface {
  static const String baseUrl = "https://blog-app-backend.onrender.com/api/";

  final http.Client httpClient;
  ArticleProvider({required this.httpClient});

  @override
  Future<List<Article>> getArticles() {
    // TODO: implement getArticles
    throw UnimplementedError();
  }

  @override
  Future<List<Article>> searchArticles(searchText) {
    // TODO: implement searchArticles
    throw UnimplementedError();
  }

  @override
  Future<List<Article>> filterArticles(String filter) {
    // TODO: implement filterArticles
    throw UnimplementedError();
  }
}

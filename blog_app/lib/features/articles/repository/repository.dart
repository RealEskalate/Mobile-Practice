import 'package:flutter/foundation.dart';

import '../data_provider/article_provider_interface.dart';
import '../models/article.dart';

class ArticlesRepository implements ArticleProviderInterface {
  final ArticleProviderInterface dataProvider;
  final ArticleProviderInterface mockDataProvider;

  ArticlesRepository(
      {required this.dataProvider, required this.mockDataProvider});

  @override
  Future<List<Article>> getArticles() async {
    try {
      return await dataProvider.getArticles();
    } catch (e) {
      return await mockDataProvider.getArticles();
    }
  }

  @override
  Future<List<Article>> searchArticles(String searchText) async {
    try {
      return await dataProvider.searchArticles(searchText);
    } catch (e) {
      return await mockDataProvider.searchArticles(searchText);
    }
  }

  @override
  Future<List<Article>> filterArticles(String filter) async {
    debugPrint("Filter articles");
    try {
      return await dataProvider.filterArticles(filter);
    } catch (e) {
      return await mockDataProvider.filterArticles(filter);
      //throw Exception("Test");
    }
  }
}

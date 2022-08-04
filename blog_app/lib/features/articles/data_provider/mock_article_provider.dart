import 'dart:io';

import '../models/article.dart';
import 'article_provider_interface.dart';

class MockArticleProvider implements ArticleProviderInterface {
  @override
  Future<List<Article>> getArticles() async {
    await Future.delayed(const Duration(milliseconds: 200));
    List<Article> articles = [
      Article.sample(),
      Article.sample(),
      Article.sample()
    ];
    return articles;
  }

  @override
  Future<List<Article>> searchArticles(String searchText) async {
    await Future.delayed(const Duration(milliseconds: 200));
    List<Article> articles = [
      Article.sample(),
      Article.sample(),
      Article.sample()
    ];
    return articles;
  }

  @override
  Future<List<Article>> filterArticles(String filter) async {
    await Future.delayed(const Duration(milliseconds: 200));
    List<Article> articles = [
      Article.sample(),
      Article.sample(),
      Article.sample()
    ];
    return articles;
  }
}

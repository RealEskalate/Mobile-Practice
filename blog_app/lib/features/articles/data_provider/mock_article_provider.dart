import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

import '../models/article.dart';
import 'article_provider_interface.dart';

class MockArticleProvider implements ArticleProviderInterface {
  Future<List<Article>> readJson() async {
    print("Read Json");
    final String response =
        await rootBundle.loadString('assets/articles_data.json');
    List<dynamic> data = await json.decode(response);
    return data.map((aricle) => Article.fromJson(aricle)).toList();
// ...
  }

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
    try {
      List<Article> articles = await readJson();
      print(articles.toString());
      print("try end");

      return articles;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

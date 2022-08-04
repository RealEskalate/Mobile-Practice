

import '../data_provider/article_provider copy.dart';
import '../models/article copy.dart';

class ArticleDetailRepository {
  final _provider = ApiProvider();

  Future<Article> getArticleById(String articleId) {
    return _provider.getArticleById(articleId);
  }
  void getAllArticles(){
    return _provider.getAllArticles();
  }
}

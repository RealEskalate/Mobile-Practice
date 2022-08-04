
import '../models/article.dart';

abstract class ArticleProviderInterface {
  Future<List<Article>> getArticles();

  Future<List<Article>> searchArticles(String searchText);

  Future<List<Article>> filterArticles(String filter); 
}

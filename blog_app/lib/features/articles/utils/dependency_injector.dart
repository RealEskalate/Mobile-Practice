
import 'package:http/http.dart' as http;

import '../data_provider/article_provider.dart';
import '../data_provider/article_provider_interface.dart';
import '../data_provider/mock_article_provider.dart';
import '../repository/articles_list_repository.dart';


class DependencyInjector {
  static http.Client? _httpClient;
  static ArticleProvider? _dataProvider;
  static ArticlesRepository? _articlesRepository;

  static http.Client? getHttpClient() {
    _httpClient ??= http.Client();
    return _httpClient;
  }

  static ArticleProviderInterface? getDataProvider() {
    _dataProvider ??= ArticleProvider(httpClient: getHttpClient()!);
    return _dataProvider;
  }

  static ArticleProviderInterface? getArticlesRepository() {
    _articlesRepository ??= ArticlesRepository(
        dataProvider: getDataProvider()!,
        mockDataProvider: MockArticleProvider());

    return _articlesRepository;
  }
}

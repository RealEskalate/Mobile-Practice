import 'package:blog_app/features/articles/presentation/add_edit_article/New_article.dart';
import 'package:blog_app/features/articles/presentation/articles_list/articles.dart';
import 'package:blog_app/features/profile/presentation/pages/profiles.dart';
import 'package:flutter/material.dart';
import 'features/articles/presentation/articles_detail/article_details_page.dart';
import 'features/auth/presentation/pages/index.dart';

class PageRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case HomePage.rounteName:
      //   return MaterialPageRoute(builder: (context) {
      //     return HomePage();
      //   });
      case ProfilePage.routeName:
        return MaterialPageRoute(builder: (context) {
          return const ProfilePage();
        });
      case ArticlesListPage.routeName:
        return MaterialPageRoute(builder: (context) {
          return const ArticlesListPage();
        });

      case AddArticlePage.routeName:
        return MaterialPageRoute(builder: (context) {
          return const AddArticlePage();
        });

      case ArticleDetailPage.rounteName:
        return MaterialPageRoute(builder: (context) {
          return ArticleDetailPage();
        });

      case RegisterPage.rounteName:
        return MaterialPageRoute(builder: (context) {
          return const RegisterPage();
        });

      case LoginPage.rounteName:
        return MaterialPageRoute(builder: (context) {
          return const LoginPage();
        });
    }
    return null;
  }
}

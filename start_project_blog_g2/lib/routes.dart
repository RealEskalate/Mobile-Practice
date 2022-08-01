import 'package:flutter/material.dart';
import 'package:start_project_blog_g2/homepage/home_page.dart';
import 'package:start_project_blog_g2/screens/new_article.dart';

class PageRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.rounteName:
        return MaterialPageRoute(builder: (context) {
          return const HomePage();
        });
      case NewArticlePage.rounteName:
        return MaterialPageRoute(builder: (context) {
          return NewArticlePage(title: "new articles page",);
        });
    }
    return null;
  }
}

import 'package:flutter/material.dart';
import 'package:start_project_blog_g1/features/homepage/home_page.dart';

class PageRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.rounteName:
        return MaterialPageRoute(builder: (context) {
          return const HomePage();
        });
    }
    return null;
  }
}

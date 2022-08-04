import 'package:flutter/material.dart';
import 'package:blog_app/features/homepage/home_page.dart';

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

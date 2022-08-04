
import 'package:flutter/material.dart';
import 'features/auth/presentation/pages/index.dart';

class PageRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case HomePage.rounteName:
      //   return MaterialPageRoute(builder: (context) {
      //     return HomePage();
      //   });

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

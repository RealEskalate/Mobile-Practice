import 'package:flutter/material.dart';
import 'package:start_project_blog_g2/utilis/colors.dart';

class HomePage extends StatelessWidget {
  static const String rounteName = "/homepage";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: headerBackground,
        title: const Text(
          "Home page",
          style: TextStyle(fontFamily: "Poppins Medium", color: headerText),
        ),
      ),
      body: const Center(child: Text("Home page")),
    );
  }
}

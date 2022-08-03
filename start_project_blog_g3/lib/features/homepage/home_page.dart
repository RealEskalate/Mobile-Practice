import 'package:flutter/material.dart';
import '../../../core/utils/colors.dart';

class HomePage extends StatelessWidget {
  static const String rounteName = "/homepage";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String best = "MISGE WAS HERE! LOGIN PAGE IS DONE!";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: headerBackground,
        title: Text(
          best,
          style: TextStyle(fontFamily: "Poppins Medium", color: headerText),
        ),
      ),
      body: Center(child: Text("Home page")),
    );
  }
}

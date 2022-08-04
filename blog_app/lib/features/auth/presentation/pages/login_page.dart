import 'package:blog_app/features/auth/presentation/widgets/index.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';
import '../widgets/widgets.dart';
class LoginPage extends StatelessWidget {
  static const String rounteName = "/login";
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.09),
            child: Column(
            children:[
              WelcomeText(),
              SizedBox(
                    height: screenHeight * 0.05,
                  ),

              Container(
               child:const LoginForm(),
               )
            ], ) 
            )])));}}




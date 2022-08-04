import 'package:flutter/material.dart';

Size displaySize(BuildContext context){
  
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context){
  var appbarHeight = kToolbarHeight;
  var statusBarHeight = MediaQuery.of(context).padding.top;
  var bottomNavBar = kBottomNavigationBarHeight;
  double realHeight = displaySize(context).height-appbarHeight-statusBarHeight-bottomNavBar;
   return realHeight;
}

double displayWidth(BuildContext context){
  
  return displaySize(context).width;
}
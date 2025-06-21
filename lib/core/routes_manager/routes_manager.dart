import 'package:flutter/cupertino.dart';
import 'package:news_app/screens/home/home.dart';
import 'package:news_app/screens/search_screen/search_screen.dart';
import 'package:news_app/screens/splash_screen/splash_screen.dart';

class RoutesManager{
  static const String splash = "/splash";
  static const String home = "/splash";
  static const String search = "/search";




  static Route? router (RouteSettings settings){
    switch(settings.name){
      case splash : return CupertinoPageRoute(builder: (context) => SplashScreen(),);
      case home : return CupertinoPageRoute(builder: (context) => HomePage(),);
      case search : return CupertinoPageRoute(builder: (context) => SearchScreen(),);
    }
    return null;
  }
}
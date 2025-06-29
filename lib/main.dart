import 'package:flutter/material.dart';
import 'package:news_app/provider/configuration_provider.dart';
import 'package:news_app/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'core/dependency_injection/di.dart';
import 'news_app.dart';

void main() {
  configureDependencies();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ConfigProvider(),),
          ChangeNotifierProvider(create: (context) => HomeProvider(),)
        ],

      builder: (context, child) => const NewsApp()));
}



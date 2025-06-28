import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/configuration/theme_configuration.dart';
import 'package:news_app/core/routes_manager/routes_manager.dart';
import 'package:news_app/provider/configuration_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'l10n/app_localizations.dart';


class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  late ConfigProvider configProvider;

  @override
  Widget build(BuildContext context) {
   configProvider = Provider.of<ConfigProvider>(context);
   initiateConfiguration();

    return ScreenUtilInit(
      designSize: Size(393, 852),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute:RoutesManager.router ,
        initialRoute: RoutesManager.home,
        theme: ThemeManager.light,
        darkTheme: ThemeManager.dark,
        themeMode: configProvider.currentTheme,
        localizationsDelegates:AppLocalizations.localizationsDelegates ,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(configProvider.currentLanguage),
      ),
    );
  }

  void initiateConfiguration()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   String lang =  sharedPreferences.getString("lang") ?? "en";
   String theme = sharedPreferences.getString("theme") ?? "Light";
   configProvider.changeAppLanguage(lang);
   if(theme == "Dark"){
     configProvider.changeAppTheme(ThemeMode.dark);
   }else if(theme == "Light"){
     configProvider.changeAppTheme(ThemeMode.light);
   }


  }
}

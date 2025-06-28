
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/routes_manager/routes_manager.dart';
import 'package:news_app/provider/home_provider.dart';
import 'package:news_app/screens/home/drawer/home_drawer.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeProvider homeProvider;
  @override
  Widget build(BuildContext context) {
    homeProvider= Provider.of<HomeProvider>(context);
    changeHomeTitleLanguage();

    return Scaffold(
      appBar: AppBar(
         actionsPadding: EdgeInsets.all(16),
        title: Text(homeProvider.homeTitle),
        actions: [SizedBox(width: 10.w,),
          IconButton(onPressed: (){
            Navigator.pushNamed(context, RoutesManager.search);
          },icon: Icon(Icons.search_outlined,))
        ],
      ),
      body:homeProvider.homeView,
      drawer: HomeDrawer(),
    );
  }

  String changeHomeTitleLanguage(){

    switch(homeProvider.homeTitle){
      case "Home" || "الرئيسية" : homeProvider.homeTitle = AppLocalizations.of(context)!.home;
      case "Sports" || "رياضة" : homeProvider.homeTitle = AppLocalizations.of(context)!.sports;
      case "General" || "عام" : homeProvider.homeTitle = AppLocalizations.of(context)!.general;
      case "Entertainment" || "ترفيه" : homeProvider.homeTitle = AppLocalizations.of(context)!.entertainment;
      case "Health" || "صحة" : homeProvider.homeTitle = AppLocalizations.of(context)!.health;
      case "Business" || "اقتصاد" : homeProvider.homeTitle = AppLocalizations.of(context)!.business;
      case "Technology" || "تكنولوجيا" : homeProvider.homeTitle = AppLocalizations.of(context)!.technology;
      case "Science" || "علوم" : homeProvider.homeTitle = AppLocalizations.of(context)!.science;
    }
    return homeProvider.homeTitle;
  }
}

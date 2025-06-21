

import 'package:flutter/material.dart';
import 'package:news_app/screens/home/category_view/category_view.dart';
import 'package:news_app/screens/home/source_view/source_view.dart';

import '../data/models/category_model.dart';

class HomeProvider extends ChangeNotifier{
  String homeTitle = "Home";
  void changeHomeTitle(String categoryTitle){
    if (homeView == CategoryView()) return;
    homeTitle= categoryTitle;
    notifyListeners();

  }
  Widget homeView = CategoryView();
  void goToSourcesView(CategoryModel category){
    homeView = SourceView(category: category,);
    notifyListeners();
  }
  void goToCategoryView(){
    if(homeView == CategoryView())return;
    homeView = CategoryView();
    notifyListeners();
  }



}
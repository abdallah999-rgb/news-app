import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigProvider extends ChangeNotifier{
  ThemeMode currentTheme = ThemeMode.dark;
  String theme = "Dark";
  bool get isDark => currentTheme == ThemeMode.dark  ;


  void changeAppTheme(ThemeMode newTheme)async{
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    currentTheme = newTheme;
    await sharedPrefs.setString("theme", newTheme == ThemeMode.dark ? "Dark" : "Light");
    notifyListeners();
  }





  String currentLanguage = "en";
  bool get isEnglish => currentLanguage == "en";
  void changeAppLanguage(String newLanguage)async{
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    currentLanguage = newLanguage;
    await sharedPrefs.setString("lang", newLanguage);
    notifyListeners();
  }
}
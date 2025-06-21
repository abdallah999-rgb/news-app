import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/assets_manager/assets_manager.dart';
import 'package:news_app/core/colors_manager/colors_manager.dart';
import 'package:news_app/provider/configuration_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../home/home.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  Widget build(BuildContext context) {
    var configProvider = Provider.of<ConfigProvider>(context);
    return FlutterSplashScreen(
      duration: const Duration(seconds: 2),
      nextScreen: const HomePage(),
      backgroundColor: configProvider.currentTheme== ThemeMode.dark? ColorsManager.black17 : ColorsManager.white,
      splashScreenBody: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             SizedBox(
              height: 100.h,
            ),

             Spacer(),
            SizedBox(
              width: 200.w,
              child: Image.asset(configProvider.isDark ?AssetsManager.radioForDark: AssetsManager.radioForLight),
            ),
             Spacer(),
             SizedBox(
              height: 100.h,
            ),
          ],
        ),
      ),
    );
  }
}

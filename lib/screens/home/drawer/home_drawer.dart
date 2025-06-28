import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/colors_manager/colors_manager.dart';
import 'package:news_app/provider/configuration_provider.dart';
import 'package:news_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {

bool isDark = true;
bool isEnglish = true;
late String theme;

  @override
  Widget build(BuildContext context) {

   var configProvider = Provider.of<ConfigProvider>(context);
    var homeProvider = Provider.of<HomeProvider>(context);

    return Drawer(
      backgroundColor: ColorsManager.black17,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 166.h,
            color: ColorsManager.white,
            child: Text(
              "News App",
              style: GoogleFonts.inter(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: ColorsManager.black17,
              ),
            ),
          ),

          Padding(
            padding: REdgeInsets.all(16.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    homeProvider.goToCategoryView();
                    homeProvider.homeTitle = "Home";
                    Navigator.pop(context);


                  },
                  child: Row(
                    children: [
                      Icon(Icons.home, color: ColorsManager.white, size: 30.sp),
                      SizedBox(width: 10.w),
                      Text(
                        AppLocalizations.of(context)!.goToHome,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: ColorsManager.white,
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 24.h,),
                Divider(color: ColorsManager.white,thickness: 2,),
                SizedBox(height: 16.h,),
                Row(
                  children: [
                    Icon(Icons.imagesearch_roller_outlined,color: ColorsManager.white,),
                    SizedBox(width: 10.w,),
                    Text(
                      AppLocalizations.of(context)!.theme,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: ColorsManager.white,
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 16.h,),
                Container(
                  padding: REdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(color: ColorsManager.white,width: 1.w)
                  ),
                  child: Row(
                    children: [
                      Text(
                        configProvider.isDark ? theme = AppLocalizations.of(context)!.dark : theme = AppLocalizations.of(context)!.light,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: ColorsManager.white,
                        ),
                      ),
                      Spacer(),
                      Switch(value: configProvider.isDark, onChanged: (value) {
                        isDark = !isDark;
                        value= isDark;
                        if(value){

                          configProvider.changeAppTheme(ThemeMode.dark);
                        }else{
                          configProvider.changeAppTheme(ThemeMode.light);
                        }
                        setState(() {

                        });



                      },)
                    ],
                  ),
                ),
                SizedBox(height: 24.h,),
                Divider(color: ColorsManager.white,thickness: 2,),
                SizedBox(height: 16.h,),
                Row(
                  children: [
                    Icon(Icons.language_outlined,color: ColorsManager.white,),
                    SizedBox(width: 10.w,),
                    Text(
                      AppLocalizations.of(context)!.language,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: ColorsManager.white,
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 16.h,),
                Container(
                  padding: REdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(color: ColorsManager.white,width: 1.w)
                  ),
                  child: Row(
                    children: [
                      Text(
                        configProvider.isEnglish ? "English" : "عربي",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: ColorsManager.white,
                        ),
                      ),
                      Spacer(),
                      Switch(value: configProvider.isEnglish, onChanged: (value) {

                        isEnglish = !isEnglish;
                        value = isEnglish;
                        if(value){
                          configProvider.changeAppLanguage("en");
                          


                        }else{
                          configProvider.changeAppLanguage("ar");


                        }

                        setState(() {

                        });


                      },)
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

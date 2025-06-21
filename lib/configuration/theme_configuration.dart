import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/colors_manager/colors_manager.dart';

class ThemeManager{
 static final ThemeData dark = ThemeData(
    primaryColor: ColorsManager.black17,
    scaffoldBackgroundColor: ColorsManager.black17,
    appBarTheme: AppBarTheme(

      backgroundColor: ColorsManager.black17,
      foregroundColor: ColorsManager.white,
      titleTextStyle: GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight.w500,color: ColorsManager.white),
      centerTitle: true,
      iconTheme: IconThemeData(color: ColorsManager.white,size: 26),

    ),
    iconTheme: IconThemeData(color: ColorsManager.white,size: 26),
   elevatedButtonTheme: ElevatedButtonThemeData(style:ElevatedButton.styleFrom(
     padding: EdgeInsets.all(12),
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
     foregroundColor: ColorsManager.white,
     backgroundColor: ColorsManager.black17,

   ),),
    textTheme: TextTheme(
      titleMedium: GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight.w500 , color: ColorsManager.white),
      bodyLarge: GoogleFonts.inter(fontSize: 24,fontWeight: FontWeight.w500,color: ColorsManager.white),
      bodyMedium: GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.bold,color: ColorsManager.white),
      bodySmall: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500,color: ColorsManager.black17),


    ),
   tabBarTheme: TabBarThemeData(
     dividerColor: Colors.transparent,
     tabAlignment: TabAlignment.start,
     labelColor: ColorsManager.white,
     indicatorColor: ColorsManager.white,

   )


  );
  static final ThemeData light = ThemeData(
      primaryColor: ColorsManager.white,
      scaffoldBackgroundColor: ColorsManager.white,
      appBarTheme: AppBarTheme(

        backgroundColor: ColorsManager.white,
        foregroundColor: ColorsManager.black17,
        titleTextStyle: GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight.w500,color: ColorsManager.black17),
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorsManager.black17,size: 26),

      ),
      iconTheme: IconThemeData(color: ColorsManager.black17,size: 26),
      elevatedButtonTheme: ElevatedButtonThemeData(style:ElevatedButton.styleFrom(
        padding: EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        foregroundColor: ColorsManager.black17,
        backgroundColor: ColorsManager.white,

      ),),

      textTheme: TextTheme(
        titleMedium: GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight.w500 , color: ColorsManager.black17),
        bodyLarge: GoogleFonts.inter(fontSize: 24,fontWeight: FontWeight.w500,color: ColorsManager.black17),
        bodyMedium: GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.bold,color: ColorsManager.black17),
        bodySmall: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500,color: ColorsManager.white),


      ),
      tabBarTheme: TabBarThemeData(
        dividerColor: Colors.transparent,
        tabAlignment: TabAlignment.start,
        labelColor: ColorsManager.black17,
        indicatorColor: ColorsManager.black17,

      )



  );

}
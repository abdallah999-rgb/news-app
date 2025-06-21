import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/colors_manager/colors_manager.dart';
import 'package:news_app/core/result.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({super.key, this.serverError, this.generalEX});
final ServerError? serverError;
final Exception? generalEX;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(errorMessage(),style: GoogleFonts.inter(color: ColorsManager.white,fontSize: 20.sp,fontWeight: FontWeight.bold),),)
      ],
    );
  }


  String errorMessage(){
    String message ="Try Again later";
    if(serverError != null){
      message = serverError!.message;
      return message;
    }
    if (generalEX is SocketException){
      message = "No Internet connection 😑";
      return message;
    }
    if (generalEX is HttpException){
      message = "Couldn't find the post 😱";
      return message;
    }
    if (generalEX is FormatException){
      message = "Bad response format 👎";
      return message;
    }
  return message;
  }
}

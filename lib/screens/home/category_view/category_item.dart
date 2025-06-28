import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/assets_manager/assets_manager.dart';
import 'package:news_app/provider/configuration_provider.dart';
import 'package:news_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../data/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    var configProvider = Provider.of<ConfigProvider>(context);
    var homeProvider = Provider.of<HomeProvider>(context);
    return InkWell(
      onTap: () {
        homeProvider.goToSourcesView(category);
        homeProvider.changeHomeTitle(category.title);
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child:  configProvider.currentTheme == ThemeMode.dark
                ? Stack(
              children: [
                Image.asset(
                 category.imagePath
                ),
                category.categoryNumber % 2 == 0
                    ? Positioned(
                  top: 140.h,
                  right: 220.w,
                      child: Image.asset(
                        AssetsManager.leftDarkViewAll,

                      ),
                    )
                    : Positioned(
                  top: 140.h,
                      left: 190.w,
                      child: Image.asset(
                        AssetsManager.rightDarkViewAll,
                        alignment: Alignment.center,
                      ),
                    ),
              ],
            ):Stack(
              children: [
                Image.asset(
                    category.darkImagePath
                ),
                category.categoryNumber % 2 == 0
                    ? Positioned(
                  top: 140.h,
                  right: 210.w,
                  child: Image.asset(
                    AssetsManager.leftLightViewAll

                  ),
                )
                    : Positioned(
                  top: 140.h,
                  left: 190.w,
                  child: Image.asset(
                    AssetsManager.rightLightViewAll,
                    alignment: Alignment.center,
                  ),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}

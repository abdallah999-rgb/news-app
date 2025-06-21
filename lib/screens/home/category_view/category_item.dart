import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        homeProvider.changeHomeTitle( category.title  );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(configProvider.currentTheme == ThemeMode.dark ?category.imagePath: category.darkImagePath)),
        ],
      ),
    );
  }
}

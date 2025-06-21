import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/screens/home/category_view/category_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../data/models/category_model.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(15.0),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.goodMorningHereIsSomeNewsForYou,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 10.h,),
          Expanded(
            child: ListView.separated(
              itemBuilder:
                  (context, index) =>
                      CategoryItem(category: CategoryModel.categories[index]),
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              itemCount: CategoryModel.categories.length,
            ),
          ),
        ],
      ),
    );
  }
}

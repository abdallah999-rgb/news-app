

import '../../core/assets_manager/assets_manager.dart';

class CategoryModel {
  final String id;
  final String title;
  final String imagePath;
  final String darkImagePath;

  const CategoryModel(
      {required this.id, required this.title, required this.imagePath , required this.darkImagePath,});

  static List<CategoryModel> _getCategories() =>
      [
        CategoryModel(
            id: "sports", title: "Sports", imagePath: AssetsManager.sports, darkImagePath: AssetsManager.darkSports, ),
        CategoryModel(id: "entertainment",
            title: "Entertainment",
            imagePath: AssetsManager.entertainment, darkImagePath:AssetsManager.darkEntertainment,),
        CategoryModel(id: "business",
            title: "Business",
            imagePath: AssetsManager.business, darkImagePath: AssetsManager.darkBusiness, ),
        CategoryModel(
            id: "science", title: "Science", imagePath: AssetsManager.science, darkImagePath: AssetsManager.darkScience, ),
        CategoryModel(id: "technology",
            title: "Technology",
            imagePath: AssetsManager.technology, darkImagePath: AssetsManager.darkTechnology, ),
        CategoryModel(
            id: "health", title: "Health", imagePath: AssetsManager.health, darkImagePath: AssetsManager.darkHealth, ),
        CategoryModel(
            id: "general", title: "General", imagePath: AssetsManager.general, darkImagePath: AssetsManager.darkGeneral,),

      ];
  static List<CategoryModel> categories = _getCategories();
}





import '../../core/assets_manager/assets_manager.dart';

class CategoryModel {
  final String id;
  final String title;
  final String imagePath;
  final String darkImagePath;
  final int categoryNumber;

  const CategoryModel( 
      {required this.id, required this.title, required this.imagePath , required this.darkImagePath,required this.categoryNumber});

  static List<CategoryModel> _getCategories() =>
      [

        CategoryModel(
          id: "general", title: "General", imagePath: AssetsManager.general, darkImagePath: AssetsManager.darkGeneral, categoryNumber: 1,),
        CategoryModel(id: "business",
          title: "Business",
          imagePath: AssetsManager.business, darkImagePath: AssetsManager.darkBusiness, categoryNumber: 2, ),
        CategoryModel(
            id: "sports", title: "Sports", imagePath: AssetsManager.sports, darkImagePath: AssetsManager.darkSports, categoryNumber: 3, ),
        CategoryModel(id: "technology",
          title: "Technology",
          imagePath: AssetsManager.technology, darkImagePath: AssetsManager.darkTechnology, categoryNumber: 4, ),
        CategoryModel(id: "entertainment",
            title: "Entertainment",
            imagePath: AssetsManager.entertainment, darkImagePath:AssetsManager.darkEntertainment, categoryNumber: 5,),
        CategoryModel(
          id: "health", title: "Health", imagePath: AssetsManager.health, darkImagePath: AssetsManager.darkHealth, categoryNumber: 6, ),
        CategoryModel(
            id: "science", title: "Science", imagePath: AssetsManager.science, darkImagePath: AssetsManager.darkScience, categoryNumber: 7, ),




      ];
  static List<CategoryModel> categories = _getCategories();
  
}



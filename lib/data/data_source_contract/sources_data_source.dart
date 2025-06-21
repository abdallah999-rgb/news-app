import 'package:news_app/core/result.dart';
import 'package:news_app/data/api_services/sources_rsponse/Source.dart';
import 'package:news_app/data/models/category_model.dart';

abstract class SourcesDataSource{
  Future<Result<List<Source>>> getSources(CategoryModel category);
}
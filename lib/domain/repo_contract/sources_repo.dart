import 'package:news_app/core/result.dart';
import 'package:news_app/data/models/category_model.dart';
import 'package:news_app/domain/entities/sources_entity.dart';

abstract class SourcesRepo{
  Future<Result<List<SourceEntity>>> getSources(CategoryModel category);
}
import 'package:news_app/core/result.dart';
import 'package:news_app/domain/entities/articles_entity.dart';


abstract class SearchRepo{
  Future<Result<List<ArticleEntity>>> search(String query);
}
import 'package:news_app/core/result.dart';

import 'package:news_app/domain/entities/sources_entity.dart';

import '../api_services/articles_response/Article.dart';

abstract class ArticlesDataSource{
  Future<Result<List<Article>>> getArticles(SourceEntity source);
}
import 'package:news_app/core/result.dart';

import 'package:news_app/domain/entities/articles_entity.dart';
import 'package:news_app/domain/entities/sources_entity.dart';

abstract class ArticleRepo{
  Future <Result<List<ArticleEntity>>> getArticles(SourceEntity source);
}
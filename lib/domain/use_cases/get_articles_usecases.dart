import 'package:news_app/core/result.dart';
import 'package:news_app/domain/entities/articles_entity.dart';
import 'package:news_app/domain/entities/sources_entity.dart';
import 'package:news_app/domain/repo_contract/article_repo.dart';

class GetArticleUsesCases{
  ArticleRepo repository;
  GetArticleUsesCases({required this.repository});
  Future<Result<List<ArticleEntity>>> invoke(SourceEntity sourceEntity)async{
    return await repository.getArticles(sourceEntity);
  }
}
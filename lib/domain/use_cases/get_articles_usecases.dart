import 'package:injectable/injectable.dart';
import 'package:news_app/core/result.dart';
import 'package:news_app/domain/entities/articles_entity.dart';
import 'package:news_app/domain/entities/sources_entity.dart';
import 'package:news_app/domain/repo_contract/article_repo.dart';
@injectable
class GetArticleUsesCases{
  ArticleRepo repository;
  @factoryMethod
  GetArticleUsesCases({required this.repository});
  Future<Result<List<ArticleEntity>>> invoke(SourceEntity sourceEntity)async{
    return await repository.getArticles(sourceEntity);
  }
}
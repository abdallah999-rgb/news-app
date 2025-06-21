import 'package:news_app/core/result.dart';
import 'package:news_app/data/api_services/articles_response/Article.dart';
import 'package:news_app/data/data_source_contract/articles_data_source.dart';
import 'package:news_app/domain/entities/articles_entity.dart';
import 'package:news_app/domain/entities/sources_entity.dart';
import '../../domain/repo_contract/article_repo.dart';

class ArticleRepoImpl extends ArticleRepo{
  ArticlesDataSource articlesDataSource;
  ArticleRepoImpl({required this.articlesDataSource});
  @override
  Future<Result<List<ArticleEntity>>> getArticles(SourceEntity source)async {
   var result = await articlesDataSource.getArticles(source);
   switch(result) {
     case Success<List<Article>>():
       return Success(data: result.data.map((article)=> article.toArticleEntity()).toList());

     case ServerError<List<Article>>():
       return ServerError(code: result.code, message: result.message);

     case GeneralEX<List<Article>>():
     return GeneralEX(exception: result.exception);
   }
  }

}
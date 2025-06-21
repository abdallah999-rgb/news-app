import 'package:news_app/core/result.dart';
import 'package:news_app/domain/entities/articles_entity.dart';
import '../../domain/repo_contract/search_repo.dart';
import '../data_source_contract/search_datasource.dart';
import '../../data/api_services/articles_response/Article.dart';

class SearchRepoImpl extends SearchRepo{
  final SearchDataSource _dataSource;
  SearchRepoImpl(this._dataSource);
  @override
  Future<Result<List<ArticleEntity>>> search(String query) async{
   var result =  await _dataSource.search(query);

   switch(result){

     case Success<List<Article>>():
       return Success(data: result.data.map((article)=>article.toArticleEntity()).toList());

     case ServerError<List<Article>>():
      return ServerError(code: result.code, message: result.message);
     case GeneralEX<List<Article>>():
       return GeneralEX(exception: result.exception);
   }

  }

}
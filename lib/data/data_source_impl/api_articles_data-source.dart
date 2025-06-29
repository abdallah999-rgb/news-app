import 'package:injectable/injectable.dart';
import 'package:news_app/core/result.dart';
import 'package:news_app/data/api_services/api_services.dart';
import 'package:news_app/data/api_services/articles_response/Article.dart';
import 'package:news_app/data/data_source_contract/articles_data_source.dart';
import 'package:news_app/domain/entities/sources_entity.dart';

@Injectable(as: ArticlesDataSource)
class ApiArticlesDataSourceImpl implements ArticlesDataSource{
  APIServices apiServices;
  @factoryMethod
  ApiArticlesDataSourceImpl({required this.apiServices});
  @override
  Future<Result<List<Article>>> getArticles(SourceEntity source) async{
  return await  apiServices.getArticles(source);
  }

}
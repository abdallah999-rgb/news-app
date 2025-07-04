

import 'package:injectable/injectable.dart';
import 'package:news_app/core/result.dart';

import '../data_source_contract/search_datasource.dart';
import '../api_services/api_services.dart';
import '../api_services/articles_response/Article.dart';


@Injectable(as:SearchDataSource )
class SearchDataSourceImpl implements SearchDataSource{
  final APIServices apiServices;
  @factoryMethod
  SearchDataSourceImpl(this.apiServices);
  @override
  Future<Result<List<Article>>> search(String query) async{
    
   return await apiServices.search(query);


  }

}
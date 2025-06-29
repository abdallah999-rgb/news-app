import 'package:injectable/injectable.dart';
import 'package:news_app/core/result.dart';
import 'package:news_app/data/api_services/api_services.dart';
import 'package:news_app/data/data_source_contract/sources_data_source.dart';
import 'package:news_app/data/models/category_model.dart';
import '../api_services/sources_rsponse/Source.dart';

@Injectable(as: SourcesDataSource)
class ApiSourcesDataSourceImpl implements SourcesDataSource{
  APIServices apiServices;
  @factoryMethod
  ApiSourcesDataSourceImpl({required this.apiServices});
  @override
  Future<Result<List<Source>>> getSources(CategoryModel category) async{
   return await apiServices.getSources(category);

  }

}
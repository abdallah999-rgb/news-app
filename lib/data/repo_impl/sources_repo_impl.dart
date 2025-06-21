import 'package:news_app/core/result.dart';
import 'package:news_app/data/api_services/sources_rsponse/Source.dart';
import 'package:news_app/data/data_source_contract/sources_data_source.dart';
import 'package:news_app/data/models/category_model.dart';
import 'package:news_app/domain/entities/sources_entity.dart';

import '../../domain/repo_contract/sources_repo.dart';

class SourcesRepoImpl implements SourcesRepo{
  SourcesDataSource dataSource;
  SourcesRepoImpl({required this.dataSource});
  @override
  Future<Result<List<SourceEntity>>> getSources(CategoryModel category)async {
    var result = await dataSource.getSources(category);
    switch(result){

      case Success<List<Source>>():
      return  Success(data: result.data.map((source)=> source.toSourceEntity()).toList());
      case ServerError<List<Source>>():
  return ServerError(code: result.code, message: result.message);
      case GeneralEX<List<Source>>():
     return GeneralEX(exception: result.exception);
    }

  }

}
import 'package:injectable/injectable.dart';
import 'package:news_app/core/result.dart';
import 'package:news_app/data/models/category_model.dart';
import 'package:news_app/domain/entities/sources_entity.dart';
import 'package:news_app/domain/repo_contract/sources_repo.dart';

@injectable
class GetSourceUsesCases{
  SourcesRepo repository;
  @factoryMethod
  GetSourceUsesCases({required this.repository});
  Future<Result<List<SourceEntity>>> invoke(CategoryModel category)async{
    return await repository.getSources(category);
  }
}
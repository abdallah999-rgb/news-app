import 'package:injectable/injectable.dart';
import 'package:news_app/domain/entities/articles_entity.dart';
import 'package:news_app/domain/repo_contract/search_repo.dart';
import '../../core/result.dart';

@injectable
class SearchUseCases{
  SearchRepo repository;
  @factoryMethod
  SearchUseCases({required this.repository});
  Future<Result<List<ArticleEntity>>> invoke(String query)async{
    return await repository.search(query);
  }
}
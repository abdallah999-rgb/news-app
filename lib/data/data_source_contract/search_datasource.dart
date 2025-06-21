import 'package:news_app/core/result.dart';

import '../api_services/articles_response/Article.dart';

abstract class SearchDataSource{
  Future<Result<List<Article>>> search(String query);
}
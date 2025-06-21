import 'package:flutter/cupertino.dart';
import 'package:news_app/core/result.dart';
import 'package:news_app/domain/entities/articles_entity.dart';
import '../data/api_services/articles_response/Article.dart';
import '../domain/repo_contract/search_repo.dart';

class SearchProvider extends ChangeNotifier{
  final SearchRepo _searchRepo;
  SearchProvider(this._searchRepo);
  bool isLoading = false;
  List<ArticleEntity> articles = [];
  String? errorMessage ;
  search(String query)async{
    if(query.isEmpty){
      articles =[];
      notifyListeners();
      return;
    }
    isLoading = true;
  var result =  await _searchRepo.search(query);
  switch(result){

    case Success<List<ArticleEntity>>():
     isLoading =false;
     articles = result.data;
     notifyListeners();
     break;
    case ServerError<List<ArticleEntity>>():
     isLoading = false;
     errorMessage = result.message;
     notifyListeners();
     break;
    case GeneralEX<List<ArticleEntity>>():
      isLoading = false;
      errorMessage = result.exception.toString();
      notifyListeners();
      break;
  }
  }
}
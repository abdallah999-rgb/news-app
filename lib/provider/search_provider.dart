import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/result.dart';
import 'package:news_app/domain/entities/articles_entity.dart';
import 'package:news_app/domain/use_cases/search_use_cases.dart';
@injectable
class SearchProvider extends ChangeNotifier{
  final SearchUseCases searchUseCases;
  @factoryMethod
  SearchProvider(this.searchUseCases);
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
  var result =  await searchUseCases.invoke(query);
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
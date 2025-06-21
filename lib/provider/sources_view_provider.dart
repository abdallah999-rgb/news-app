import 'package:flutter/material.dart';
import 'package:news_app/core/result.dart';
import 'package:news_app/domain/entities/articles_entity.dart';
import 'package:news_app/domain/entities/sources_entity.dart';
import 'package:news_app/domain/use_cases/get_articles_usecases.dart';
import 'package:news_app/domain/use_cases/get_sources_use_cases.dart';
import '../data/models/category_model.dart';


class SourcesViewProvider extends ChangeNotifier{
  GetSourceUsesCases sourcesUseCase;
  GetArticleUsesCases articleUsesCases;
  SourcesViewProvider({required this.articleUsesCases,required this.sourcesUseCase});
   List <SourceEntity> sources = [];
  SourcesState sourcesState = SourcesLoadingState();
  ArticlesState articlesState = ArticlesLoadingState();
 void changeSourcesState(SourcesState newState){
    sourcesState = newState;
    notifyListeners();
  }
  void changeArticlesState(ArticlesState newState){
   articlesState =newState;
   notifyListeners();
  }

 Future <void> loadSources(CategoryModel category)async{
   changeSourcesState(SourcesLoadingState(loadingMessage: "Loading......."));
    var result = await sourcesUseCase.invoke(category);
    notifyListeners();
    switch(result) {
      case Success<List<SourceEntity>>():
        sources = result.data;
      changeSourcesState(SourcesSuccessState(sources: result.data));
      case ServerError<List<SourceEntity>>():
    changeSourcesState(SourcesErrorState(serverError: result));

      case GeneralEX<List<SourceEntity>>():
      changeSourcesState(SourcesErrorState(generalEX: result.exception));
    }

  }

  Future<void> loadArticles (SourceEntity source)async{
   changeArticlesState(ArticlesLoadingState());
   var result = await articleUsesCases.invoke(source);
   notifyListeners();
   switch (result){

     case Success<List<ArticleEntity>>():
      changeArticlesState(ArticlesSuccessState(articles: result.data));

     case ServerError<List<ArticleEntity>>():
      changeArticlesState(ArticlesErrorState(serverError: result));
     case GeneralEX<List<ArticleEntity>>():
      changeArticlesState(ArticlesErrorState(generalEX: result.exception));
   }

  }

}


sealed class SourcesState{}

class SourcesSuccessState extends SourcesState {
  List<SourceEntity> sources ;
  SourcesSuccessState({required this.sources});
}

class SourcesLoadingState extends SourcesState {
  String? loadingMessage;
  SourcesLoadingState({ this.loadingMessage});
}

class SourcesErrorState extends SourcesState {
  ServerError? serverError ;
  Exception? generalEX;
  SourcesErrorState({ this.serverError , this.generalEX});
}




sealed class ArticlesState{}

class ArticlesSuccessState extends ArticlesState {
  List<ArticleEntity> articles ;
  ArticlesSuccessState({required this.articles});
}

class ArticlesLoadingState extends ArticlesState {
  String? loadingMessage;
  ArticlesLoadingState({ this.loadingMessage});
}

class ArticlesErrorState extends ArticlesState {
  ServerError? serverError ;
  Exception? generalEX;
  ArticlesErrorState({ this.serverError , this.generalEX});
}
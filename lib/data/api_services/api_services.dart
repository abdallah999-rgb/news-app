import 'dart:convert';
import 'package:http/http.dart' as http; // as http يعني كإني بديها اسم اتعامل بيه بعد كده
import 'package:injectable/injectable.dart';
import 'package:news_app/core/result.dart';
import 'package:news_app/data/api_services/sources_rsponse/Source.dart';
import 'package:news_app/data/api_services/sources_rsponse/SourcesResponse.dart';
import 'package:news_app/domain/entities/sources_entity.dart';
import '../models/category_model.dart';
import 'articles_response/Article.dart';
import 'articles_response/ArticlesResponse.dart';

@singleton
class APIServices {

  static const String _baseUrl = "newsapi.org";
  static const String _sourcesEndPoint = "/v2/top-headlines/sources";
  static const String _articlesEndPoint = "/v2/everything";
  static const String _apiKey = "8169acf3935841f5887c89491d794a46";

   Future<Result<List<Source>>> getSources(CategoryModel category) async {
    try{
      Uri url = Uri.https(_baseUrl, _sourcesEndPoint, {
        "apiKey": _apiKey,
        "category": category.id
      });
      http.Response response = await http.get(url);
      var json = jsonDecode(response.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      if(sourcesResponse.status=="ok"){
        return Success(data: sourcesResponse.sources!);
      }else{
        return ServerError(code: sourcesResponse.code!, message: sourcesResponse.message!);
      }
    } on Exception catch(e){
      return GeneralEX(exception: e);

    }

  }

   Future <Result<List<Article>>> getArticles (SourceEntity source) async {
    try {
      Uri url = Uri.https(_baseUrl, _articlesEndPoint, {
        "apiKey": _apiKey,
        "sources": source.id
      });
      http.Response response = await http.get(url);
      var json = jsonDecode(response.body);
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
      if (articlesResponse.status == "ok") {
        return Success(data: articlesResponse.articles!);
      } else {
        return ServerError(code: articlesResponse.code!, message: articlesResponse.message!);
      }
    } on Exception  catch (e) {
     return GeneralEX(exception: e);
    }
  }

   Future <Result<List<Article>>> search (String query) async {
    try {
      Uri url = Uri.https(_baseUrl, _articlesEndPoint, {
        "apiKey": _apiKey,
        "q": query
      });
      http.Response response = await http.get(url);
      var json = jsonDecode(response.body);
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
      if (articlesResponse.status == "ok") {
        return Success(data: articlesResponse.articles!);
      } else {
        return ServerError(code: articlesResponse.code!, message: articlesResponse.message!);
      }
    } on Exception  catch (e) {
      return GeneralEX(exception: e);
    }
  }


}
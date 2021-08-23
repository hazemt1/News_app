import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/modal/NewsResponse.dart';
import 'package:news_app/modal/Source.dart';
import 'package:news_app/modal/SourceResponse.dart';

Future<SourceResponse> getSources(String category)async{
  // https://newsapi.org/v2/top-headlines/sources?apiKey=3ed0d5dca43940c1b65140d0ab1270eb&category=sports
  final uri =Uri.https('newsapi.org', '/v2/top-headlines/sources',
  {
    'apiKey':'8c4d7ba02aaa41d195908ecef536978c',
    'category' : '$category'
  });
  final response = await http.get(uri);
  // print(response.body);
  if(response.statusCode>=200&&response.statusCode<300){
    return SourceResponse.fromJsonMap(jsonDecode(response.body));
  }
  else{
    throw Exception(response.body);
  }
}

Future<NewsResponse> getNews(Source source,String searchText) async {
  //https://newsapi.org/v2/everything?sources=bbc-news&apiKey=3ed0d5dca43940c1b65140d0ab1270eb
  final uri ;
  if(searchText=='')
    uri= Uri.https('newsapi.org', '/v2/everything',
      {'apiKey': '8c4d7ba02aaa41d195908ecef536978c', 'sources': source.id});
  else
    uri= Uri.https('newsapi.org', '/v2/everything',
        {'apiKey': '8c4d7ba02aaa41d195908ecef536978c', 'q': searchText});
  final response = await http.get(uri);
  // print(response.statusCode);
  if (response.statusCode >= 200 && response.statusCode <300 ) {
    return NewsResponse.fromJsonMap(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}
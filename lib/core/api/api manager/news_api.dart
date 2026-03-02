import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/api/end%20points/news_end_point.dart';
import 'package:news_app/core/utils/constants/api_constant.dart';
import 'package:news_app/feature/news/data/model/news_by_sources.dart';
import 'package:news_app/feature/news/data/model/news_response.dart';

class NewsApiManager {
  static Future<NewsResponseTabs> getResponse(String id) async {
    Uri url = Uri.https(ApiConstant.serverName, NewsEndPoint.newsSources, {
      "apiKey": ApiConstant.apiKey2,
      'category':id
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewsResponseTabs.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  // todo: get news by sources

  static Future<NewsResponseBySource> getNewsBySources(String sourceId) async {
    Uri url = Uri.https(ApiConstant.serverName, NewsEndPoint.newsBodySource, {
      "apiKey": ApiConstant.apiKey2,
      "sources": sourceId,
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      print(json);
      return NewsResponseBySource.fromJson(json);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  // todo: search 
static Future<NewsResponseBySource> search(String q) async {
    Uri url = Uri.https(ApiConstant.serverName, NewsEndPoint.newsBodySource, {
      "apiKey": ApiConstant.apiKey2,
      "q": q,
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      print(json);
      return NewsResponseBySource.fromJson(json);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}

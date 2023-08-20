import 'package:flutter/material.dart';
import '../../data/models/news_model.dart';
import 'package:http/http.dart' as http;

// https://newsdata.io/api/1/news
// ?apikey=pub_279372ec92cba7baa04ab16f4cb131a4eca34
// &languaje=en

String _apikey = '?apikey=pub_279372ec92cba7baa04ab16f4cb131a4eca34';
String _languaje = '&language=en';
String _country = '&country=us';
String url = 'https://newsdata.io/api/1/news$_apikey$_languaje$_country';

class NewsProvider extends ChangeNotifier {
  List<Result> newsList = [];

  // metodo
  NewsProvider() {
    print("LLAMANDO A NEWS");

    getNews();
  }

  getNews() async {
    final response = await http.get(Uri.parse(url));

    final resp = newsModelFromJson(response.body);

    newsList.addAll(resp.results);

    notifyListeners();
  }
}

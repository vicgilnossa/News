import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/categoria.dart';
import 'package:news_app/models/news_response.dart';
import 'package:http/http.dart' as http;

final url_news = "newsapi.org/v2";
final api_key = "b6fc7db70cfd4d9c91d4792207b9fbb6";

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = "business";
  List<Categoria> categories = [
    Categoria("Negocios", "business"),
    Categoria("General", "general"),
    Categoria("Salud", "health"),
    Categoria("Ciencia", "science"),
    Categoria("Deportes", "sports"),
    Categoria("Tecnología", "technology")
  ];
  List<Article> entertaiment = [];
  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadlines();
    getEntertaiment();
    categories.forEach((item) {
      categoryArticles[item.backendname] = [];
    });
  }

  get selectedCategory => _selectedCategory;
  set selectedCategory(valor) {
    _selectedCategory = valor;
    getArticlesByCategory(valor);
    notifyListeners();
  }

  List<Article>? get getArticleByCategorySelected =>
      categoryArticles[selectedCategory];

  getTopHeadlines() async {
    print("Cargando headlines");
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=co&apiKey=b6fc7db70cfd4d9c91d4792207b9fbb6");
    final resp = await http.get(url);
    final newsResponse = NewsResponse.fromJson(resp.body);
    this.headlines.addAll(newsResponse.articles);

    print(url);

    notifyListeners();
  }

  getEntertaiment() async {
    print("Cargando entretenimiento");
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=co&apiKey=b6fc7db70cfd4d9c91d4792207b9fbb6&category=entertainment");
    final resp = await http.get(url);
    final newsResponse = NewsResponse.fromJson(resp.body);
    entertaiment.addAll(newsResponse.articles);

    print(url);

    notifyListeners();
  }

  getArticlesByCategory(category) async {
    if (this.categoryArticles[category]!.length > 0) {
      return categoryArticles[category];
    }
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=co&apiKey=b6fc7db70cfd4d9c91d4792207b9fbb6&category=$category");
    final resp = await http.get(url);
    final newsResponse = NewsResponse.fromJson(resp.body);
    categoryArticles[category]!.addAll(newsResponse.articles);
    print(categoryArticles);
    print(selectedCategory);
    print(getArticleByCategorySelected);
    notifyListeners();
  }
}

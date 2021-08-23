
import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String _searchText = '';
  String currentLocale = "ar";

  void setSearchText(String searchText) {
    _searchText = searchText;
    notifyListeners();
  }

  void changeLanguage(String lang){
    if(currentLocale == lang)
      return;
    currentLocale =lang;
    notifyListeners();
  }

  String getSearchText() => _searchText;
}

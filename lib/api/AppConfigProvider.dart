
import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String _searchText = '';
  String currentLocale = "en";
  bool _folded=true;


  void setSearchText(String searchText) {
    _searchText = searchText;
    notifyListeners();
  }
  bool getFolded()=>_folded;
  toggleFold(){_folded=!_folded;}


  void changeLanguage(String lang){
    if(currentLocale == lang)
      return;
    currentLocale =lang;
    notifyListeners();
  }

  String getSearchText() => _searchText;
}

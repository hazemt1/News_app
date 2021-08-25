import 'package:flutter/material.dart';
import 'package:news_app/home/CategoryScreen.dart';
import 'package:news_app/home/HomeScreen.dart';
import 'package:news_app/home/Setting.dart';
import 'Home/widgets/ArticleContentScreen.dart';
import 'Home/widgets/ArticleScreen.dart';
import 'modal/Article.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case CategoryScreen.routeName:
        if (arg is CategoryScreenArguments)
          return MaterialPageRoute(builder: (_) => CategoryScreen(arg));
        else
          return _errorScreen();
      case ArticleScreen.routeName:
        if (arg is Article)
          return MaterialPageRoute(builder: (_) => ArticleScreen(arg));
        else
          return _errorScreen();
      case ArticleContentScreen.routeName:
        if (arg is Article)
          return MaterialPageRoute(builder: (_) => ArticleContentScreen(arg));
        else
          return _errorScreen();
      case Setting.routeName:
        return MaterialPageRoute(builder: (_) => Setting());
      default:
        return _errorScreen();
    }
  }

  static Route<dynamic> _errorScreen() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Text(
            'Error',
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/home/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(57, 165, 82, 1.0),
      ),
       home: HomeScreen(),
    );
  }
}


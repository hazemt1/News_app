import 'package:flutter/material.dart';
import 'package:news_app/home/CategoryScreen.dart';
import 'package:news_app/home/HomeScreen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchText(),
      builder: (context, widget) {
        return MaterialApp(
          theme: ThemeData(
            primaryColor: Color.fromRGBO(57, 165, 82, 1.0),
          ),
          home: HomeScreen(),
        );
      },
    );
  }
}

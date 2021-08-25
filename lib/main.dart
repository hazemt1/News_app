import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/RouteGenerator.dart';
import 'package:news_app/api/AppConfigProvider.dart';
import 'package:news_app/home/HomeScreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppConfigProvider(),
      builder: (context, widget) {
        final provider = Provider.of<AppConfigProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: ThemeData(
            primaryColor: Color.fromRGBO(57, 165, 82, 1.0),
          ),
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale.fromSubtags(languageCode: provider.currentLocale),
          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute: HomeScreen.routeName,
        );
      },
    );
  }
}

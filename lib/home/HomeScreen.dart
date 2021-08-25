import 'package:flutter/material.dart';
import 'package:news_app/home/CategoryScreen.dart';
import 'package:news_app/home/widgets/SideMenu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';

  final BorderRadius leftCategoryItem = BorderRadius.only(
    topLeft: Radius.circular(25),
    topRight: Radius.circular(25),
    bottomLeft: Radius.circular(25),
  );
  final BorderRadius rightCategoryItem = BorderRadius.only(
    topLeft: Radius.circular(25),
    topRight: Radius.circular(25),
    bottomRight: Radius.circular(25),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          AppLocalizations.of(context)!.title,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontFamily: 'Exo',
        ),
        centerTitle: true,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70),
            bottomRight: Radius.circular(70),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    AppLocalizations.of(context)!.homeScreenHeadLine,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Color.fromRGBO(79, 90, 105, 1.0),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    categoryItem(
                        Color.fromRGBO(201, 28, 34, 1.0),
                        'assets/images/sports.png',
                        'sports',
                        AppLocalizations.of(context)!.sports,
                        leftCategoryItem,
                        context),
                    categoryItem(
                        Color.fromRGBO(0, 62, 144, 1.0),
                        'assets/images/Politics.png',
                        'politics',
                        AppLocalizations.of(context)!.politics,
                        rightCategoryItem,
                        context),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    categoryItem(
                        Color.fromRGBO(237, 30, 121, 1.0),
                        'assets/images/health.png',
                        'health',
                        AppLocalizations.of(context)!.health,
                        leftCategoryItem,
                        context),
                    categoryItem(
                        Color.fromRGBO(207, 126, 72, 1.0),
                        'assets/images/bussines.png',
                        'business',
                        AppLocalizations.of(context)!.business,
                        rightCategoryItem,
                        context),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    categoryItem(
                        Color.fromRGBO(72, 130, 207, 1.0),
                        'assets/images/environment.png',
                        'Environment',
                        AppLocalizations.of(context)!.environment,
                        leftCategoryItem,
                        context),
                    categoryItem(
                        Color.fromRGBO(242, 211, 82, 1.0),
                        'assets/images/science.png',
                        'science',
                        AppLocalizations.of(context)!.science,
                        rightCategoryItem,
                        context),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget categoryItem(Color color, String image, String category, String title,
      BorderRadius borderRadius, BuildContext context) {
    return InkWell(
      onTap: () {
        if (category == 'politics' ||
            category == 'Environment')
          category = 'general';
        Navigator.of(context).pushNamed(
          CategoryScreen.routeName,
          arguments: CategoryScreenArguments(category.toLowerCase(), title),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 170,
        width: 150,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              image,
              height: 114,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFamily: 'Exo',
              ),
            )
          ],
        ),
      ),
    );
  }
}

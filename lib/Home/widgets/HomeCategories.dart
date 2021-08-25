import 'package:flutter/material.dart';
import 'package:news_app/home/widgets/CategoryGridItem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeCategories extends StatefulWidget {
  Function onCategoryItemClick;
  HomeCategories(this.onCategoryItemClick);
  @override
  _HomeCategoriesState createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  late List<Category> data;

  @override
  Widget build(BuildContext context) {
    data = getCategoriesList();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              GridView.builder(
                shrinkWrap: true,
                gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12
              ) ,
                itemBuilder: (buildContext,index)=>CategoryGridItem(data[index],
                  widget.onCategoryItemClick
                ),
                itemCount: data.length,

              ),
            ],
          )
      ),
    );
  }

  List<Category> getCategoriesList(){
    List<Category> list = [
      Category(
          Color.fromRGBO(201, 28, 34, 1.0),
          'assets/images/sports.png',
          'sports',
          AppLocalizations.of(context)!.sports,
          true),
      Category(
          Color.fromRGBO(0, 62, 144, 1.0),
          'assets/images/Politics.png',
          'politics',
          AppLocalizations.of(context)!.politics, false),
      Category(
          Color.fromRGBO(237, 30, 121, 1.0),
          'assets/images/health.png',
          'health',
          AppLocalizations.of(context)!.health,
          true),
      Category(
          Color.fromRGBO(207, 126, 72, 1.0),
          'assets/images/bussines.png',
          'business',
          AppLocalizations.of(context)!.business,
          false),
      Category(
          Color.fromRGBO(72, 130, 207, 1.0),
          'assets/images/environment.png',
          'Environment',
          AppLocalizations.of(context)!.environment,
          true
      ),
      Category(
          Color.fromRGBO(242, 211, 82, 1.0),
          'assets/images/science.png',
          'science',
          AppLocalizations.of(context)!.science,
          false)
    ];
    return list;
  }
}

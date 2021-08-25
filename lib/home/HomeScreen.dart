import 'package:flutter/material.dart';
import 'package:news_app/api/AppConfigProvider.dart';
import 'package:news_app/home/CategoryScreen.dart';
import 'package:news_app/home/Setting.dart';
import 'package:news_app/home/widgets/CategoryGridItem.dart';
import 'package:news_app/home/widgets/HomeCategories.dart';
import 'package:news_app/home/widgets/SearchBar.dart';
import 'package:news_app/home/widgets/SideMenu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Category? selectedCategory=null;
  bool inSetting= false;
  late String title =AppLocalizations.of(context)!.title;
  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      drawer: SideMenu(this.onSideMenuItemClick),
      appBar: AppBar(
        leading: provider.getFolded()
            ? Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu_rounded),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        )
            : Container(),
        toolbarHeight: 70,
        backgroundColor: Theme.of(context).primaryColor,
        title: provider.getFolded()?Text(
          title,
        ): null,
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
        actions: [
          (!inSetting&&selectedCategory!=null)?SearchBar():Container(),
        ],
      ),
      body: (selectedCategory==null&& !inSetting)?HomeCategories(this.onCategoryItemClick):
      (selectedCategory!=null&& !inSetting)?CategoryScreen(CategoryScreenArguments(
        selectedCategory!.category,
        selectedCategory!.title)):inSetting?Setting():null,
    );
  }


  void onCategoryItemClick(Category category){
    setState(() {
      selectedCategory = category;
      title = category.title;
    });
  }
  void onSideMenuItemClick(SideMenuItem sideMenuItem){
    if(sideMenuItem.id == SideMenuItem.CATEGORIES){
      setState(() {
        selectedCategory=null;
        inSetting=false;
        title =AppLocalizations.of(context)!.title;
      });
    }else if (sideMenuItem.id == SideMenuItem.SETTINGS){
      // to handle
      setState(() {
        inSetting=true;
        selectedCategory=null;
        title =AppLocalizations.of(context)!.settings;
      });
    }
    Navigator.pop(context);
  }
}

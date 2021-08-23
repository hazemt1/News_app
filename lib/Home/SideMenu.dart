import 'package:flutter/material.dart';
import 'package:news_app/home/HomeScreen.dart';
import 'package:news_app/home/Setting.dart';

class SideMenu extends StatelessWidget {
  final List<SideMenuItem> sideMenuList = [
    SideMenuItem(SideMenuItem.CATEGORIES, 'Categories', Icons.list,HomeScreen.routeName),
    SideMenuItem(SideMenuItem.SETTINGS, 'Settings', Icons.settings,Setting.routeName),
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(vertical: 64),
            child: Center(
              child: Text(
                'News App!',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return SideMenuWidget(sideMenuList[index]);
              },
              itemCount: sideMenuList.length,
            ),
          )
        ],
      ),
    );
  }
}

class SideMenuItem {
  static const CATEGORIES = 'Cats';
  static const SETTINGS = 'settings';
  String routeName;
  String id;
  String title;
  IconData iconData;

  SideMenuItem(this.id, this.title, this.iconData,this.routeName);
}

class SideMenuWidget extends StatelessWidget {
  final SideMenuItem sideMenuItem;

  SideMenuWidget(this.sideMenuItem);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(sideMenuItem.routeName);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.all(12), child: Icon(sideMenuItem.iconData)),
          Text(sideMenuItem.title)
        ],
      ),
    );
  }
}

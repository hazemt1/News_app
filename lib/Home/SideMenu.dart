import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  final List<SideMenuItem> sideMenuList = [
    SideMenuItem(SideMenuItem.CATEGORIES, 'Categories', Icons.list),
    SideMenuItem(SideMenuItem.SETTINGS, 'Settings', Icons.settings),
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
  String id;
  String title;
  IconData iconData;

  SideMenuItem(this.id, this.title, this.iconData);
}

class SideMenuWidget extends StatelessWidget {
  SideMenuItem sideMenuItem;

  SideMenuWidget(this.sideMenuItem);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

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

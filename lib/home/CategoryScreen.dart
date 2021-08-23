import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/ApiManger.dart';
import 'package:news_app/api/AppConfigProvider.dart';
import 'package:news_app/home/widgets/SideMenu.dart';
import 'package:news_app/home/widgets/CategoryTap.dart';
import 'package:news_app/modal/SourceResponse.dart';
import 'package:provider/provider.dart';

class CategoryScreenArguments {
  final String category;
  final String title;
  CategoryScreenArguments(this.category, this.title);
}

class CategoryScreen extends StatefulWidget {
  static const String routeName = 'CategoryScreen';
  final CategoryScreenArguments category;

  CategoryScreen(this.category);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<SourceResponse> newsSources;
  @override
  void initState() {
    super.initState();

  }

  bool _folded = true;

  late AppConfigProvider provider;

  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    newsSources = getSources(widget.category.category,provider.currentLocale);
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        leading: _folded
            ? Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.menu_rounded),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              )
            : Container(),
        backgroundColor: Theme.of(context).primaryColor,
        title: _folded
            ? Text(
                widget.category.title,
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            : null,
        centerTitle: true,
        actions: [
          searchbar(context),
        ],
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: FutureBuilder<SourceResponse>(
          future: newsSources,
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return CategoryTap(snapShot.data!.sources);
            } else if (snapShot.hasError) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 210, bottom: 40),
                    child: Text(
                      "Error Loading Data!\nTry Again!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: _refreshData,
                    child: Container(
                        // padding:EdgeInsets.only(top: 8),
                        child: new Icon(Icons.refresh)),
                  ),
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Container searchbar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20, top: 10, bottom: 5, left: 10),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        width: _folded ? 64 : 350,
        height: 20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: _folded ? Colors.transparent : Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 400),
                child: InkWell(
                  child: Icon(
                    CupertinoIcons.clear,
                    color: Theme.of(context).primaryColor,
                  ),
                  onTap: () {
                    setState(() {
                      _folded = true;
                      provider.setSearchText('');
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: !_folded
                      ? TextField(
                          decoration: InputDecoration(
                            hintText: 'Search Article',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              color: Theme.of(context).primaryColor,
                            ),
                            border: InputBorder.none,
                          ),
                          onChanged: (text) {
                            _searchText = text;
                          },
                          onSubmitted: (text) {
                            setState(() {
                              provider.setSearchText(text);
                            });
                          },
                        )
                      : null,
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 400),
                child: InkWell(
                  child: Icon(
                    CupertinoIcons.search,
                    color:
                        _folded ? Colors.white : Theme.of(context).primaryColor,
                  ),
                  onTap: () {
                    setState(() {
                      if (!_folded && _searchText != '') {
                        provider.setSearchText(_searchText);
                      } else if (_folded) _folded = !_folded;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _refreshData() async {
    await Future.delayed(Duration(milliseconds: 1));
    newsSources = getSources(widget.category.category,provider.currentLocale);
    setState(() {});
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/ApiManger.dart';
import 'package:news_app/api/AppConfigProvider.dart';
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

  late AppConfigProvider provider;


  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    newsSources = getSources(widget.category.category,provider.currentLocale);
    return Container(
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
                    "Error Loading Data!\nTry A gain!",
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
    );
  }


  Future _refreshData() async {
    await Future.delayed(Duration(milliseconds: 1));
    newsSources = getSources(widget.category.category,provider.currentLocale);
    setState(() {});
  }
}

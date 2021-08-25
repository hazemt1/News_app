import 'package:flutter/material.dart';
import 'package:news_app/api/ApiManger.dart';
import 'package:news_app/api/AppConfigProvider.dart';
import 'package:news_app/home/widgets/NewsItem.dart';
import 'package:news_app/modal/NewsResponse.dart';
import 'package:news_app/modal/Source.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class NewsFragment extends StatefulWidget {
  final Source source;

  NewsFragment(this.source);

  @override
  _NewsFragmentState createState() => _NewsFragmentState();
}

class _NewsFragmentState extends State<NewsFragment> {
  late Future<NewsResponse> newsResponse;
  late AppConfigProvider provider;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    newsResponse = getNews(widget.source, provider.getSearchText(),provider.currentLocale);
    return FutureBuilder<NewsResponse>(
        future: newsResponse,
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return ListView.builder(
                itemCount: snapShot.data!.articles.length,
                itemBuilder: (context, index) {
                  return NewsItem(snapShot.data!.articles[index]);
                });
          } else if (snapShot.hasError) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 210, bottom: 40),
                  child: Text(
                  AppLocalizations.of(context)!.errorMassageForLoading,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                FloatingActionButton(
                  onPressed: _refreshData,
                  child: Container(
                      // padding:EdgeInsets.only(top: 8),
                      child: new Icon(Icons.refresh)),
                )
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Future _refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    newsResponse = getNews(widget.source, provider.getSearchText(),provider.currentLocale);
    setState(() {});
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/api/ApiManger.dart';
// import 'package:news_app/api/SearchText.dart';
import 'package:news_app/home/CategoryScreen.dart';
import 'package:news_app/home/widgets/NewsItem.dart';
import 'package:news_app/modal/NewsResponse.dart';
import 'package:news_app/modal/Source.dart';
import 'package:provider/provider.dart';


class NewsFragment extends StatefulWidget {
  final Source source;

  NewsFragment(this.source);

  @override
  _NewsFragmentState createState() => _NewsFragmentState();
}

class _NewsFragmentState extends State<NewsFragment> {
  late Future<NewsResponse> newsResponse;
  late SearchText searchText;

  @override
  void initState() {

    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    searchText =Provider.of<SearchText>(context);
    newsResponse = getNews(widget.source,searchText.getSearchText());
    return FutureBuilder<NewsResponse>(
      future: newsResponse,
        builder: (context, snapShot) {
      if (snapShot.hasData) {
        return ListView.builder(
          itemCount: snapShot.data!.articles.length,
            itemBuilder: (context,index){
          return NewsItem(snapShot.data!.articles[index]);
        });
      } else if (snapShot.hasError) {
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Error Loading Data! Try Again!"),
            FloatingActionButton(
              onPressed: _refreshData,
              child: Container(
                  padding:EdgeInsets.only(top: 8),
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
    newsResponse = getNews(widget.source,searchText.getSearchText());
    setState(() {});
  }

}

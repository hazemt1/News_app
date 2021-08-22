import 'package:flutter/material.dart';
import 'package:news_app/api/ApiManger.dart';
import 'package:news_app/home/widgets/CategoryTap.dart';
import 'package:news_app/modal/SourceResponse.dart';

class CategoryScreen extends StatefulWidget {
  final String category;
  CategoryScreen(this.category);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<SourceResponse> newsSources;
  @override
  void initState() {
    super.initState();
    newsSources = getSources(widget.category  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,

        title: Text(
          widget.category,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
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
            fit: BoxFit.cover,
          ),
        ),
        child:FutureBuilder<SourceResponse>(
          future: newsSources,
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return CategoryTap(snapShot.data!.sources);
            } else if (snapShot.hasError) {
              return Text("Connection Error");
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/ApiManger.dart';
import 'package:news_app/home/SideMenu.dart';
import 'package:news_app/home/widgets/CategoryTap.dart';
import 'package:news_app/modal/SourceResponse.dart';
import 'package:provider/provider.dart';

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
    newsSources = getSources(widget.category);
  }

  bool _folded = true;

  late SearchText  searchText;

  String _searchText='';

  @override
  Widget build(BuildContext context) {
    searchText = Provider.of<SearchText>(context);
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
                widget.category,
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            : null,
        centerTitle: true,
        actions: [
          Container(
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
                            searchText.setSearchText('') ;
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
                                onChanged: (text){
                                  _searchText=text;
                                },
                                onSubmitted: (text) {
                                  setState(() {
                                    searchText.setSearchText(text);
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
                          color: _folded
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                        ),
                        onTap: () {
                          setState(() {
                            if (!_folded&&_searchText!='') {
                              searchText.setSearchText(_searchText);
                            }
                            _folded = !_folded;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
              return  CategoryTap(snapShot.data!.sources);

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

class SearchText extends ChangeNotifier{
  String _searchText='';

  void setSearchText(String searchText){
    _searchText=searchText;
    notifyListeners();
  }
  String getSearchText()=>_searchText;

}

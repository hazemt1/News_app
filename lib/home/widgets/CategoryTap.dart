import 'package:flutter/material.dart';
import 'package:news_app/home/widgets/NewsFragment.dart';
import 'package:news_app/home/widgets/SourceTap.dart';
import 'package:news_app/modal/Source.dart';

class CategoryTap extends StatefulWidget {
  final List<Source> sources;
  CategoryTap(this.sources);

  @override
  _CategoryTapState createState() => _CategoryTapState();
}

class _CategoryTapState extends State<CategoryTap> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                  onTap: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  indicatorColor: Colors.transparent,
                  isScrollable: true,
                  tabs: widget.sources
                      .map((source) => SourceTap(source,
                          widget.sources.indexOf(source) == currentIndex))
                      .toList()),

            ),
            Expanded(child: TabBarView(
              children: widget.sources.map((source) => NewsFragment(source)).toList(),

            ),),
          ],
        ),
    );
  }
}

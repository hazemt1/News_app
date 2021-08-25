import 'package:flutter/material.dart';
import 'package:news_app/modal/Source.dart';

class SourceTap extends StatelessWidget {
  final Source source;
  final bool selected;

  SourceTap(this.source, this.selected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(
        source.name,
        style: TextStyle(
          color: (selected) ? Colors.white : Theme.of(context).primaryColor,
          fontSize: 14,
          fontFamily: 'Exo',
        ),
      ),
      decoration: BoxDecoration(
        color: (selected) ? Theme.of(context).primaryColor : Colors.transparent,
        border: Border.all(width: 1, color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
    );
  }
}

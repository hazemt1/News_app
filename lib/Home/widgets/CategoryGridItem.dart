import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget {
  Category category;
  Function onCategoryItemClick;
  CategoryGridItem(this.category,this.onCategoryItemClick);
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (category.category == 'politics' ||
            category.category== 'Environment')
          category.category = 'general';
        onCategoryItemClick(category);
        // Navigator.of(context).pushNamed(
        //   CategoryScreen.routeName,
        //   arguments: CategoryScreenArguments(category.category.toLowerCase(),
        //       category.title),
        //);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 170,
        width: 150,
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: category.borderRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              category.image,
              height: 114,
            ),
            Text(
              category.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFamily: 'Exo',
              ),
            )
          ],
        ),
      ),
    );
  }
}
class Category{
  Color color;
  String image;
  String category;
  String title;
  bool isLeftSided;
  late BorderRadius borderRadius;
  Category(this.color,this.image, this .category, this.title,
      this.isLeftSided ){
    borderRadius = isLeftSided?
   BorderRadius.only(
      topLeft: Radius.circular(25),
      topRight: Radius.circular(25),
      bottomLeft: Radius.circular(25),
    ) :BorderRadius.only(
      topLeft: Radius.circular(25),
      topRight: Radius.circular(25),
      bottomRight: Radius.circular(25),
    );
  }
}
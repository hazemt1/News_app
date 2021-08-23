import 'package:flutter/material.dart';
import 'package:news_app/home/CategoryScreen.dart';
import 'package:news_app/home/SideMenu.dart';

class HomeScreen extends StatelessWidget {
  final BorderRadius leftCategoryItem = BorderRadius.only(
    topLeft: Radius.circular(25),
    topRight: Radius.circular(25),
    bottomLeft: Radius.circular(25),
  );
  final BorderRadius rightCategoryItem = BorderRadius.only(
    topLeft: Radius.circular(25),
    topRight: Radius.circular(25),
    bottomRight: Radius.circular(25),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(

        toolbarHeight: 70,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'News App',

        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontFamily: 'Exo',

        ),
        centerTitle: true,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70),
            bottomRight: Radius.circular(70),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover ,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Pick your category\nof interest',

                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Color.fromRGBO(79, 90, 105, 1.0),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    categoryItem(
                      Color.fromRGBO(201, 28, 34, 1.0),
                      'assets/images/sports.png',
                      'Sports',
                      leftCategoryItem,
                      context
                    ),
                    categoryItem(
                      Color.fromRGBO(0, 62, 144, 1.0),
                      'assets/images/Politics.png',
                      'Politics',
                      rightCategoryItem,
                      context
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    categoryItem(
                      Color.fromRGBO(237, 30, 121, 1.0),
                      'assets/images/health.png',
                      'Health',
                      leftCategoryItem,
                      context
                    ),
                    categoryItem(
                      Color.fromRGBO(207, 126, 72, 1.0),
                      'assets/images/bussines.png',
                      'Business',
                      rightCategoryItem,
                      context
                    ),
                  ],
                ),Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    categoryItem(
                      Color.fromRGBO(72, 130, 207, 1.0),
                      'assets/images/environment.png',
                      'Environment',
                      leftCategoryItem,
                      context
                    ),
                    categoryItem(
                      Color.fromRGBO(242, 211, 82, 1.0),
                      'assets/images/science.png',
                      'Science',
                      rightCategoryItem,
                      context
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget categoryItem(
      Color color, String image, String category, BorderRadius borderRadius,BuildContext context) {
    return InkWell(
      onTap: (){
        if(category=='Politics')
          category='general';
        else if(category=='Environment')
          category='general';
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>CategoryScreen(category.toLowerCase())));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 170,
        width: 150,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(image,height: 114,),
            Text(
              category,
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

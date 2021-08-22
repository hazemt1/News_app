import 'package:flutter/material.dart';

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
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'News App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
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
            fit: BoxFit.cover ,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                  ),
                  categoryItem(
                    Color.fromRGBO(0, 62, 144, 1.0),
                    'assets/images/Politics.png',
                    'Politics',
                    rightCategoryItem,
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
                  ),
                  categoryItem(
                    Color.fromRGBO(207, 126, 72, 1.0),
                    'assets/images/bussines.png',
                    'Business',
                    rightCategoryItem,
                  ),
                ],
              ),Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  categoryItem(
                    Color.fromRGBO(237, 30, 121, 1.0),
                    'assets/images/environment.png',
                    'Environment',
                    leftCategoryItem,
                  ),
                  categoryItem(
                    Color.fromRGBO(207, 126, 72, 1.0),
                    'assets/images/science.png',
                    'Science',
                    rightCategoryItem,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryItem(
      Color color, String image, String category, BorderRadius borderRadius) {
    return InkWell(
      onTap: (){
        
      },
      child: Container(

        height: 170,
        width: 150,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        child: Column(
          children: [
            Image.asset(image),
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

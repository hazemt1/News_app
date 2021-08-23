import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modal/Article.dart';

class NewsItem extends StatelessWidget {
  final Article article;
  NewsItem(this.article);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage,
                height: 240,
                width: double.infinity,
                fit: BoxFit.fill,
              placeholder: (context,url)=>Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Image.network(
                  'https://e7.pngegg.com/pngimages/829/733/png-clipart-logo-brand-product-trademark-font-not-found-logo-brand.png',
              ),
            )
          ),
          Text(
            article.source.name,
            style: TextStyle(
                fontSize: 10,
                fontFamily: 'Poppins',
                color: Color.fromRGBO(121, 130, 139, 1.0)),
            textAlign: TextAlign.start,
          ),
          Text(
            article.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            article.publishedAt,
            style: TextStyle(
                fontSize: 10,
                fontFamily: 'Poppins',
                color: Color.fromRGBO(121, 130, 139, 1.0)),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}

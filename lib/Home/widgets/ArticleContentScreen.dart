import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:news_app/api/AppConfigProvider.dart';
import 'package:news_app/modal/Article.dart';
import 'package:hexcolor/hexcolor.dart';

class ArticleContentScreen extends StatelessWidget {
  static const String routeName = 'ArticleContentScreen';
  final Article article;

  ArticleContentScreen(this.article);

  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          AppLocalizations.of(context)!.articleContentTitle,
          textAlign: TextAlign.center,
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
        padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 25),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage,
                    height: 240,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Image.network(
                      'https://e7.pngegg.com/pngimages/829/733/png-clipart-logo-brand-product-trademark-font-not-found-logo-brand.png',
                    ),
                  )),
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      article.source.name,
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        color: HexColor('#79828B'),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      article.title,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        color: HexColor('#42505C'),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      article.publishedAt,
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Montserrat',
                        color: HexColor('#A3A3A3'),
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.white),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        article.content,
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            color: HexColor('#42505C')),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL() async => await canLaunch(article.url)
      ? await launch(article.url)
      : throw 'Could not launch $article.url)';
}

import 'package:news_app/modal/Source.dart';

class Article {

  Source source;
  Object author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

	Article.fromJsonMap(Map<String, dynamic> map):
		source = Source.fromJsonMap(map["source"]),
		author = map["author"]!=null?map["author"]:'',
		title = map["title"]!=null?map["title"]:'',
		description = map["description"]!=null?map["description"]:'',
		url = map["url"]!=null?map["url"]:'',
		urlToImage = map["urlToImage"]!=null?map["urlToImage"]:'',
		publishedAt = map["publishedAt"]!=null?map["publishedAt"]:'',
		content = map["content"]!=null?map["content"]:'';

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['source'] = source == null ? null : source.toJson();
		data['author'] = author;
		data['title'] = title;
		data['description'] = description;
		data['url'] = url;
		data['urlToImage'] = urlToImage;
		data['publishedAt'] = publishedAt;
		data['content'] = content;
		return data;
	}
}

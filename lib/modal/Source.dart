
class Source {

  String id;
  String name;
  String description;
  String url;
  String category;
  String language;
  String country;

	Source.fromJsonMap(Map<String, dynamic> map):
		id = map["id"] != null?map["id"]:'' ,
		name = map["name"]!=null?map["name"]:'',
		description = map["description"]!=null?map["description"]:'',
		url = map["url"]!=null?map["url"]:'',
		category = map["category"]!=null?map["category"]:'',
		language = map["language"]!=null?map["language"]:'',
		country = map["country"]!=null?map["country"]:'';

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['name'] = name;
		data['description'] = description;
		data['url'] = url;
		data['category'] = category;
		data['language'] = language;
		data['country'] = country;
		return data;
	}
}

import 'package:news_app/modal/Source.dart';

class SourceResponse {

  String status;
  List<Source> sources;

	SourceResponse.fromJsonMap(Map<String, dynamic> map): 
		status = map["status"],
		sources = List<Source>.from(map["sources"].map((it) => Source.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['status'] = status;
		data['sources'] = sources != null ? 
			this.sources.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}

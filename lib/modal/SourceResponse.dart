import 'package:news_app/modal/Source.dart';

class SourceResponse {

  String status;
  List<Source> sources;

	SourceResponse.fromJsonMap(Map<String, dynamic> map): 
		status = map["status"],
		sources = List<Source>.from(map["sources"].map((it) => Source.fromJsonMap(it)));


}

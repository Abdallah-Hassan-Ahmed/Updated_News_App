class NewsResponseTabs {
  String? status;
  List<Sources>? sources;
  String? code;
  String? message;

  NewsResponseTabs({this.status, this.sources, this.code, this.message});

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "sources": sources,
      "code": code,
      "message": message,
    };
  }

  NewsResponseTabs.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    code = json["code"];
    message = json["message"];
    if (json["sources"] != null) {
      sources = [];
      json["sources"].forEach((v) {
        sources?.add(Sources.fromJson(v));
      });
    }
  }
}

class Sources {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Sources({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  Sources.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    url = json["url"];
    category = json["category"];
    language = json["language"];
    country = json["country"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "url": url,
      "category": category,
      "language": language,
      "country": country,
    };
  }
}

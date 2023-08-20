// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
    String status;
    int totalResults;
    List<Result> results;
    String nextPage;

    NewsModel({
        required this.status,
        required this.totalResults,
        required this.results,
        required this.nextPage,
    });

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"],
        totalResults: json["totalResults"] != null ? json["totalResults"] as int : 0,
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        nextPage: json["nextPage"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "nextPage": nextPage,
    };
    
}

class Result {
    String title;
    String link;
    List<String> keywords;
    List<String> creator;
    dynamic videoUrl;
    String description;
    String content;
    DateTime pubDate;
    String imageUrl;
    String sourceId;
    int sourcePriority;
    List<String> country;
    List<String> category;
    Language language;

    Result({
        required this.title,
        required this.link,
        required this.keywords,
        required this.creator,
        required this.videoUrl,
        required this.description,
        required this.content,
        required this.pubDate,
        required this.imageUrl,
        required this.sourceId,
        required this.sourcePriority,
        required this.country,
        required this.category,
        required this.language,
    });

    

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"],
        link: json["link"],
        // keywords: List<String>.from(json["keywords"].map((x) => x)),
        keywords:  (json["keywords"] as List<dynamic>?)?.map<String>((x) => x.toString()).toList() ?? ["Keywords no Disponible"],
        // creator: List<String>.from(json["creator"].map((x) => x)),
        creator: (json["creator"] as List<dynamic>?)?.map<String>((x) => x.toString()).toList() ?? ["Anonimo"],
        videoUrl: json["video_url"],
        description: json["description"] as String? ?? "Descripcion no Disponible",
        content: json["content"],
        pubDate: DateTime.parse(json["pubDate"]),
        imageUrl: json["image_url"] ?? "https://dici.uta.cl/wp-content/uploads/2019/11/error404-300x192.png",

        // imageUrl: json["image_url"] ?? "http://dici.uta.cl/wp-content/uploads/2019/11/error404-300x192.png",
       
        // imageUrl: json["image_url"] ?? "",
        sourceId: json["source_id"],
        sourcePriority: json["source_priority"],
        // country: List<String>.from(json["country"].map((x) => x)),
        country: json["country"] != null
            ? List<String>.from(json["country"].map((x) => x))
            : ["NOT INFORMATION"],
        // category: List<String>.from(json["category"].map((x) => x)),
        category:  json["category"] != null
            ? List<String>.from(json["category"].map((x) => x))
            : ["Sin Categoria"],
        language: languageValues.map[json["language"]]!,
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
        "creator": List<dynamic>.from(creator.map((x) => x)),
        "video_url": videoUrl,
        "description": description,
        "content": content,
        "pubDate": pubDate.toIso8601String(),
        "image_url": imageUrl,
        "source_id": sourceId,
        "source_priority": sourcePriority,
        "country": List<dynamic>.from(country.map((x) => x)),
        "category": List<dynamic>.from(category.map((x) => x)),
        "language": languageValues.reverse[language],
    };
}

enum Language {
    ENGLISH
}

final languageValues = EnumValues({
    "english": Language.ENGLISH
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}

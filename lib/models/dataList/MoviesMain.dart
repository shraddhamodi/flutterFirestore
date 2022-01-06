// To parse this JSON data, do
//
//     final moviesMain = moviesMainFromJson(jsonString);

import 'dart:convert';

MoviesMain moviesMainFromJson(String str) => MoviesMain.fromJson(json.decode(str));

String moviesMainToJson(MoviesMain data) => json.encode(data.toJson());

class MoviesMain {
  MoviesMain({
    this.movies,
  });

  List<Employee>? movies;

  factory MoviesMain.fromJson(Map<String, dynamic> json) => MoviesMain(
    movies: json["data"] == null ? null : List<Employee>.from(json["data"].map((x) => Employee.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": movies == null ? null : List<dynamic>.from(movies!.map((x) => x.toJson())),
  };
}

class Employee {
  Employee({
    this.id,
    this.name ,
    this.salary
  });

  int? id;
  String? name;
  int? salary;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    id: json["id"] == null ? null : json["id"],
    name: json["title"] == null ? null : json["title"],
    salary: json["user_id"] == null ? null : json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": name == null ? null : name,
    "user_id": salary == null ? null : salary,

  };
}

// enum OriginalTitle { EMPTY, ANNIHILATION, A_WRINKLE_IN_TIME, THE_LEISURE_SEEKER, CE_QUI_NOUS_LIE }

/*final originalTitleValues = EnumValues({
  "Annihilation": OriginalTitle.ANNIHILATION,
  "A Wrinkle in Time": OriginalTitle.A_WRINKLE_IN_TIME,
  "Ce qui nous lie": OriginalTitle.CE_QUI_NOUS_LIE,
  "": OriginalTitle.EMPTY,
  "The Leisure Seeker": OriginalTitle.THE_LEISURE_SEEKER
});*/

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
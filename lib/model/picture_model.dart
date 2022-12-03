import 'dart:convert';

List<PictureModel> pictureModelFromJson(String str) => List<PictureModel>.from(
    json.decode(str).map((x) => PictureModel.fromJson(x)));

String pictureModelToJson(List<PictureModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PictureModel {
  PictureModel({
    required this.id,
    this.description,
    required this.user,
    required this.urls,
  });

  final String id;
  final String? description;
  final User user;
  final Urls urls;

  factory PictureModel.fromJson(Map<String, dynamic> json) => PictureModel(
        id: json["id"],
        description: json["description"],
        user: User.fromJson(json["user"]),
        urls: Urls.fromJson(json["urls"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "user": user.toJson(),
        "urls": urls.toJson(),
      };
}

class Urls {
  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
  });

  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
      };
}

class User {
  User({
    required this.username,
    required this.name,
  });

  final String username;
  final String name;

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "name": name,
      };
}

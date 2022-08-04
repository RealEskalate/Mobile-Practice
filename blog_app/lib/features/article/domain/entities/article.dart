// To parse this JSON data, do
//
//     final article = articleFromJson(jsonString);

import 'dart:convert';
import '../../../auth/auth_index.dart';
import 'comment.dart';
// import 'package:start_project_blog_g1/models/user.dart';
// import 'package:start_project_blog_g1/models/comment.dart';

List<Article> articleFromJson(String str) =>
    List<Article>.from(json.decode(str).map((x) => Article.fromJson(x)));

String articleToJson(List<Article> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Article {
  Article({
    required this.id,
    required this.authorUserId,
    required this.title,
    required this.content,
    required this.imageUrls,
    required this.rating,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.categories,
  });

  var id;
  User authorUserId;
  String title;
  List<String> content;
  List<String> imageUrls;
  Map<String, int> rating;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  List<String> categories;

  List<Comment> Comments = [];
  // content should split the response into one list string
  factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["_id"],
        authorUserId: User.fromJson(json["authorUserId"]),
        title: json["title"],
        content: json["content"].split("."),
        imageUrls: List<String>.from(json["imageUrls"].map((x) => x)),
        rating:
            Map.from(json["rating"]).map((k, v) => MapEntry<String, int>(k, v)),
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        categories: json["categories"] == null
            ? []
            : List<String>.from(json["categories"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "authorUserId": authorUserId.toJson(),
        "title": title,
        "content": content,
        "imageUrls": List<dynamic>.from(imageUrls.map((x) => x)),
        "rating":
            Map.from(rating).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories.map((x) => x)),
      };
}

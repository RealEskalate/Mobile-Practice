// To parse this JSON data, do
//
//     final article = articleFromJson(jsonString);

import 'dart:convert';
import '../../auth/domain/entities/user.dart';
import 'comment.dart';
// import 'package:start_project_blog_g1/models/user.dart';
// import 'package:start_project_blog_g1/models/comment.dart';

List<Article> articleFromJson(String str) =>
    List<Article>.from(json.decode(str).map((x) => Article.fromJson(x)));

String articleToJson(List<Article> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Article {
  Article({
    this.numberOfComments = 0,
    this.ratingValue = 4.5,
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
    this.imageUrl =
        "https://ichef.bbci.co.uk/news/976/cpsprodpb/4A61/production/_124314091_hi065097776.jpg",
    this.authorProfileUrl =
        "https://cdn.vectorstock.com/i/1000x1000/23/81/default-avatar-profile-icon-vector-18942381.webp",
    this.authorName = "Adrain Smith",
  });

  final String authorProfileUrl;
  final String authorName;
  final String imageUrl;
  String id;
  String authorUserId;
  String title;
  List<String> content;
  List<String> imageUrls;
  Map<String, int> rating;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  List<String> categories;
  List<Comment> Comments = [];
  int numberOfComments;
  double ratingValue;

  // content should split the response into one list string
  factory Article.fromJson(Map<String, dynamic> json) {
    print("Currentt");
    print(json['numberOfComments']);
    print(json["id"]);
    print(json['authorProfileUrl']);
    print(json['authorName']);
    print(json['authorUserId']);
    print(json['title']);
    print(json['title']);
    print(json['content']);
    print(json['imageUrl']);

    Article article = Article(
      numberOfComments: json["numberOfComments"],
      ratingValue: json["ratingValue"],
      id: json["id"],
      authorProfileUrl: json['authorProfileUrl'],
      authorName: json['authorName'],
      authorUserId: json['authorUserId'],
      title: json["title"],
      content: json["content"].split("."),
      imageUrl: json["imageUrl"],
      imageUrls: [],
      rating: {},
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      categories: List<String>.from(json["categories"].map((x) => x)),
      description: json['description'],
    );

    print("NewlyCreatedArticle");
    print(article.description);

    return article;
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "authorUserId": authorUserId,
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

  factory Article.sample() {
    return Article(
        authorUserId: "id",
        categories: [],
        content: [
          'Daily Facebook users up again after decline But Facebook owner Meta is struggling with Daily Facebook users up again after decline But Facebook owner Meta is struggling with',
        ],
        createdAt: DateTime.now(),
        description:
            "The number of daily active Facebook users grew to 1.96 billion. That marked a turnaround from last year, when the social network reported a decline in users for the first time. The drop wiped billions from the firm's market value. Since executives disclosed the fall in February, the firm's share price has nearly halved. But shares jumped 19% in after-hours trade on Wednesday.",
        id: "",
        imageUrls: [
          "https://ichef.bbci.co.uk/news/976/cpsprodpb/4A61/production/_124314091_hi065097776.jpg"
        ],
        rating: {},
        title:
            'Daily Facebook users up again after decline But Facebook owner Meta is struggling with ',
        updatedAt: DateTime.now());
  }
}

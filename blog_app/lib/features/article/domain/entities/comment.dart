// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);

import 'dart:convert';

import '../../../auth/auth_index.dart';

List<Comment> commentFromJson(String str) =>
    List<Comment>.from(json.decode(str).map((x) => Comment.fromJson(x)));

String commentToJson(List<Comment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comment {
  Comment({
    required this.id,
    required this.user,
    required this.text,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  User user;
  String text;
  DateTime createdAt;
  DateTime updatedAt;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["_id"],
        user: User.fromJson(json["user"]),
        text: json["text"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user.toJson(),
        "text": text,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

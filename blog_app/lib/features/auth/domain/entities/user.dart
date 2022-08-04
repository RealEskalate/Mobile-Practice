// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.id,
    required this.email,
    this.profileId = "",
  });

  var id;
  String email;
  var profileId;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["_id"] ?? "",
      email: json["email"],
      profileId: json["profileId"] == null
          ? null
          : ProfileId.fromJson(json["profileId"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "profileId": profileId == null ? null : profileId.toJson(),
      };
}

class ProfileId {
  ProfileId({
    required this.id,
    required this.bio,
    required this.imageUrl,
  });

  var id;
  String bio;
  String imageUrl;

  factory ProfileId.fromJson(Map<String, dynamic> json) => ProfileId(
        id: json["_id"] ?? "",
        bio: json["bio"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "bio": bio,
        "imageUrl": imageUrl,
      };
}

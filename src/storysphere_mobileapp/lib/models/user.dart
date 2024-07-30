import 'dart:convert';

import 'package:intl/intl.dart';

List<User> usersFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.userId,
    this.username,
    this.userPassword,
    this.email,
    this.role,
    this.displayName,
    this.selfIntroduction,
    this.dateOfBirth,
    this.favGenreKeywords,
    this.accountBalance,
    this.avatar,
    this.bgImg,
  });

  int? userId;
  String? username;
  String? userPassword;
  String? email;
  String? role;
  String? displayName;
  String? selfIntroduction;
  DateTime? dateOfBirth;
  String? favGenreKeywords;
  double? accountBalance;
  String? avatar;
  String? bgImg;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["_id"],
        username: json["username"],
        userPassword: json["userPassword"],
        email: json["email"],
        role: json["role"],
        displayName: json["displayName"],
        selfIntroduction: json["selfIntroduction"],
        dateOfBirth: tryParseString(json["dateOfBirth"]),
        favGenreKeywords: json["favGenreKeywords"],
        accountBalance: json["accountBalance"]*1.0,
        avatar: json["avatar"],
        bgImg: json["bgImg"],

      );

  Map<String, dynamic> toJson() => {
        "_id": userId,
        "username": username,
        "userPassword": userPassword,
        "email": email,
        "role": role,
        "displayName": displayName,
        "selfIntroduction": selfIntroduction,
        "dateOfBirth": dateOfBirth,
        "favGenreKeywords": favGenreKeywords,
        "accountBalance": accountBalance,
        "avatar": avatar,
        "bgImg": bgImg,
      };
}

// Function to try parsing date strings
  DateTime? tryParseString(String? inputDateTime) {
    if (inputDateTime == null || inputDateTime.isEmpty) {
      return null;
    }
    try {
      // Try parsing as ISO 8601 string
      DateTime? dateTime = DateTime.tryParse(inputDateTime);
      if (dateTime != null) {
        return dateTime;
      }

      // Try parsing as custom format
      DateFormat inputFormat = DateFormat('dd/MM/yyyy');
      dateTime = inputFormat.parse(inputDateTime);
      return dateTime;
    } catch (e) {
      return null;
    }
  }


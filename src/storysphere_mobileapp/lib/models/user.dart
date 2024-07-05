import 'dart:convert';

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

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userId"],
        username: json["username"],
        userPassword: json["userPassword"],
        email: json["email"],
        role: json["role"],
        displayName: json["displayName"],
        selfIntroduction: json["selfIntroduction"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        favGenreKeywords: json["favGenreKeywords"],
        accountBalance: json["accountBalance"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "username": username,
        "userPassword": userPassword,
        "email": email,
        "role": role,
        "displayName": displayName,
        "selfIntroduction": selfIntroduction,
        "dateOfBirth": dateOfBirth,
        "favGenreKeywords": favGenreKeywords,
        "accountBalance": accountBalance,
      };
}
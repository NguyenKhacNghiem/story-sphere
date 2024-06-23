import 'dart:convert';

List<Comment> commentsFromJson(String str) => List<Comment>.from(json.decode(str).map((x) => Comment.fromJson(x)));

Comment commentFromJson(String str) => Comment.fromJson(json.decode(str));

String commentToJson(Comment data) => json.encode(data.toJson());

class Comment {
  Comment({
    this.comtId,
    this.userId,
    this.chapterId,
    this.atParagraph,
    this.comtContent,
    this.comtTime,
    this.replyTo,
  });

  int? comtId;
  int? userId;
  int? chapterId;
  String? atParagraph;
  String? comtContent;
  DateTime? comtTime;
  int? replyTo;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        comtId: json["comtId"],
        userId: json["userId"],
        chapterId: json["chapterId"],
        atParagraph: json["atParagraph"],
        comtContent: json["comtContent"],
        comtTime: DateTime.parse(json["comtTime"]),
        replyTo: json["replyTo"],
      );

  Map<String, dynamic> toJson() => {
        "comtId": comtId,
        "userId": userId,
        "chapterId": chapterId,
        "atParagraph": atParagraph,
        "comtContent": comtContent,
        "comtTime": comtTime,
        "replyTo": replyTo,
      };
}

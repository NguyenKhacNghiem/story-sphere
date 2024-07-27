
import 'dart:convert';

List<Review> reviewsFromJson(String str) => List<Review>.from(json.decode(str).map((x) => Review.fromJson(x)));

Review reviewFromJson(String str) => Review.fromJson(json.decode(str));

String reviewToJson(Review data) => json.encode(data.toJson());

class Review {
  Review({
    this.reviewId,
    this.userId,
    this.storyId,
    this.ratePoint,
    this.reviewContent,
    this.reviewTime,
    this.replyTo,
  });

  int? reviewId;
  int? userId;
  int? storyId;
  int? ratePoint;
  String? reviewContent;
  DateTime? reviewTime;
  int? replyTo;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        reviewId: json["_id"],
        userId: json["userId"],
        storyId: json["storyId"],
        ratePoint: json["ratePoint"],
        reviewContent: json["reviewContent"],
        reviewTime: DateTime.parse(json["reviewTime"]),
        replyTo: json["replyTo"],
      );

  Map<String, dynamic> toJson() => {
        "reviewId": reviewId,
        "userId": userId,
        "storyId": storyId,
        "ratePoint": ratePoint,
        "reviewContent": reviewContent,
        "reviewTime": reviewTime,
        "replyTo": replyTo,
      };
}

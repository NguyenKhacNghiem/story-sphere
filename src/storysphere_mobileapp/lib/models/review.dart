
import 'dart:convert';

import 'package:intl/intl.dart';

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

  Map<String, dynamic> toJson() => {
      "reviewId": reviewId,
      "userId": userId,
      "storyId": storyId,
      "ratePoint": ratePoint,
      "reviewContent": reviewContent,
      "reviewTime": reviewTime,
      "replyTo": replyTo,
    };

   factory Review.fromJson(Map<String, dynamic> json) => Review(
        reviewId: json["_id"],
        userId: json["userId"],
        storyId: json["storyId"],
        ratePoint: json["ratePoint"], // Ensure ratePoint is double
        reviewContent: json["reviewContent"],
        reviewTime: tryParseString(json["reviewTime"]),
        replyTo: json["replyTo"],
      );
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
    DateFormat inputFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
    dateTime = inputFormat.parse(inputDateTime);
    return dateTime;
  } catch (e) {
    return null;
  }

}

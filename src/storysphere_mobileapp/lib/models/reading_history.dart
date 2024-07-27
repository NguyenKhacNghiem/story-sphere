

import 'dart:convert';
import 'dart:core';

List<ReadingHistory> readingHistorysFromJson(String str) => List<ReadingHistory>.from(json.decode(str).map((x) => ReadingHistory.fromJson(x)));

ReadingHistory readingHistoryFromJson(String str) => ReadingHistory.fromJson(json.decode(str));

String readingHistoryToJson(ReadingHistory data) => json.encode(data.toJson());

class ReadingHistory {
  ReadingHistory({
    this.readingHistoryId,
    this.userId,
    this.storyId,
    this.chapterId,
    this.lastVisited,
  });

  int? readingHistoryId;
  int? userId;
  int? storyId;
  int? chapterId;
  DateTime? lastVisited;

  factory ReadingHistory.fromJson(Map<String, dynamic> json) => ReadingHistory(
        readingHistoryId: json["_id"],
        userId: json["userId"],
        storyId: json["storyId"],
        chapterId: json["chapterId"],
        lastVisited: DateTime.parse(json["lastVisited"]),
        
      );

  Map<String, dynamic> toJson() => {
        "readingHistoryId": readingHistoryId,
        "userId": userId,
        "storyId": storyId,
        "chapterId": chapterId,
        "ReadingHistoryTime": lastVisited,
      };
}

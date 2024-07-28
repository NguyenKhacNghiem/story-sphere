import 'dart:convert';
import 'package:intl/intl.dart';

List<Chapter> chaptersFromJson(String str) => List<Chapter>.from(json.decode(str).map((x) => Chapter.fromJson(x)));

Chapter chapterFromJson(String str) => Chapter.fromJson(json.decode(str));

String chapterToJson(Chapter data) => json.encode(data.toJson());

class Chapter {
  Chapter({
    this.chapterId,
    this.fkStoryId,
    this.chapterName,
    this.chapterUrlKey,
    this.chapterContent,
    this.chapterOrder,
    this.chapterStatus,
    this.matureContent,
    this.viewCount,
    this.voteCount,
    this.commentCount,
    this.wordsCount,
    this.createdDate,
    this.lastUpdated,
    this.commercialActivated,
    this.chapterSellPrice,
  });

  int? chapterId;
  int? fkStoryId;
  String? chapterName;
  String? chapterUrlKey;
  String? chapterContent;
  int? chapterOrder;
  int? chapterStatus;
  bool? matureContent;
  int? viewCount;
  int? voteCount;
  int? commentCount;
  int? wordsCount;
  DateTime? createdDate;
  DateTime? lastUpdated;
  bool? commercialActivated;
  double? chapterSellPrice;

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        chapterId: json["_id"],
        fkStoryId: json["fk_storyId"],
        chapterName: json["chapterName"].toString(),
        chapterUrlKey: json["chapterUrlKey"].toString(),
        chapterContent: json["chapterContent"].toString(),
        chapterOrder: json["chapterOrder"],
        chapterStatus: json["chapterStatus"],
        matureContent: json["maturedContent"],
        viewCount: json["viewCount"],
        voteCount: json["voteCount"],
        commentCount: json["commentCount"],
        wordsCount: json["wordsCount"],
        createdDate: tryParseString(json["createDate"]),
        lastUpdated: tryParseString(json["lastUpdate"]),
        commercialActivated: json["commercialActivated"],
        chapterSellPrice: double.tryParse(json["chapterSellPrice"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "chapterId": chapterId,
        "fk_storyId": fkStoryId,
        "chapterName": chapterName,
        "chapterUrlKey": chapterUrlKey,
        "chapterContent": chapterContent,
        "chapterOrder": chapterOrder,
        "chapterStatus": chapterStatus,
        "maturedContent": matureContent,
        "viewCount": viewCount,
        "voteCount": voteCount,
        "commentCount": commentCount,
        "wordsCount": wordsCount,
        "createdDate": createdDate!.toIso8601String(),
        "lastUpdate": lastUpdated!.toIso8601String(),
        "commercialActivated": commercialActivated,
        "chapterSellPrice": chapterSellPrice,
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
      DateFormat inputFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
      dateTime = inputFormat.parse(inputDateTime);
      return dateTime;
    } catch (e) {
      return null;
    }
  }

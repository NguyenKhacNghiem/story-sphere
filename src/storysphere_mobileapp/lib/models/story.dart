import 'dart:convert';

import 'package:intl/intl.dart';

List<Story> storiesFromJson(String str) => List<Story>.from(json.decode(str).map((x) => Story.fromJson(x)));

Story storyFromJson(String str) => Story.fromJson(json.decode(str));

String storyToJson(Story data) => json.encode(data.toJson());

class Story {
  Story({
    this.storyId,
    this.storyName,
    this.storyUrl,
    this.storyCover,
    this.storyContentOutline, 
    this.fkPublisherAccount, 
    this.bookAuthorName, 
    this.bookPublisherName, 
    this.bookISBNcode, 
    this.bookPublishDate, 
    this.categoriesAndTags, 
    this.selfComposedStory, 
    this.matureContent, 
    this.published, 
    this.chapterCount, 
    this.viewCount, 
    this.voteCount, 
    this.commentCount, 
    this.ratingPoint, 
    this.createdDate, 
    this.lastUpdate, 
    this.commercialActivated, 
    this.storySellPrice,
  });

  int? storyId;
  String? storyName;
  String? storyUrl;
  String? storyCover;
  String? storyContentOutline;
  int? fkPublisherAccount;
  String? bookAuthorName;
  String? bookPublisherName;
  String? bookISBNcode;
  DateTime? bookPublishDate;
  String? categoriesAndTags;
  bool? selfComposedStory;
  bool? matureContent;
  bool? published;
  int? viewCount;
  int? voteCount;
  int? commentCount;
  int? chapterCount;
  double? ratingPoint;
  DateTime? createdDate;
  DateTime? lastUpdate;
  bool? commercialActivated;
  double? storySellPrice;

  factory Story.fromJson(Map<String, dynamic> json) => Story(
        storyId: json["_id"],
       storyName: json["storyName"],
       storyUrl: json["url"],
       storyCover: json["cover"],
       storyContentOutline: json["contentOutline"],
        fkPublisherAccount: json["fk_publisherAccount"],
       bookAuthorName: json["authorName"],
       bookPublisherName: json["publisherName"],
       bookISBNcode: json["ISBNcode"],
        bookPublishDate: tryParseString(json["publishDate"]),
       categoriesAndTags: json["categoriesAndTags"].toString(),
        selfComposedStory: json["selfComposedStory"],
        matureContent: json["matureContent"],
        published: json["published"],
        viewCount: json["viewCount"],
        voteCount: json["voteCount"],
        commentCount: json["commentCount"],
        ratingPoint: double.tryParse(json["ratingPoint"].toString()),
        chapterCount: json["chapterCount"],
        createdDate: tryParseString(json["createdDate"]),
        lastUpdate: tryParseString(json["lastUpdate"]),
        commercialActivated: json["commercialActivated"],
        storySellPrice: double.tryParse(json["storySellPrice"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "_id": storyId,
        "storyName": storyName,
        "url": storyUrl,
        "cover": storyCover,
        "contentOutline": storyContentOutline,
        "fk_publisherAccount": fkPublisherAccount,
        "authorName": bookAuthorName,
        "publisherName": bookPublisherName,
        "ISBNcode": bookISBNcode,
        "publishDate": bookPublishDate!.toIso8601String(),
        "categoriesAndTags": categoriesAndTags,
        "selfComposedStory": selfComposedStory,
        "matureContent": matureContent,
        "published": published,
        "viewCount": viewCount,
        "chapterCount": chapterCount,
        "voteCount": voteCount,
        "commentCount": commentCount,
        "ratingPoint": ratingPoint,
        "createdDate": createdDate!.toIso8601String(),
        "lastUpdate": lastUpdate!.toIso8601String(),
        "commercialActivated": commercialActivated,
        "storySellPrice": storySellPrice,
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

import 'dart:convert';

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
        storyId: json["storyId"],
        storyName: json["storyName"],
        storyUrl: json["storyUrl"],
        storyCover: json["storyCover"],
        storyContentOutline: json["storyContentOutline"],
        fkPublisherAccount: json["fk_publisherAccount"],
        bookAuthorName: json["book_authorName"],
        bookPublisherName: json["book_publisherName"],
        bookISBNcode: json["book_ISBNcode"],
        bookPublishDate: DateTime.parse(json["book_publishDate"]),
        categoriesAndTags: json["categoriesAndTags"],
        selfComposedStory: json["selfComposedStory"],
        matureContent: json["matureContent"],
        published: json["published"],
        viewCount: json["viewCount"],
        voteCount: json["voteCount"],
        commentCount: json["commentCount"],
        ratingPoint: json["ratingPoint"],
        chapterCount: json["chapterCount"],
        createdDate: DateTime.parse(json["createdDate"]),
        lastUpdate: DateTime.parse(json["lastUpdate"]),
        commercialActivated: json["commercialActivated"],
        storySellPrice: json["storySellPrice"],
      );

  Map<String, dynamic> toJson() => {
        "storyId": storyId,
        "storyName": storyName,
        "storyUrl": storyUrl,
        "storyCover": storyCover,
        "storyContentOutline": storyContentOutline,
        "fk_publisherAccount": fkPublisherAccount,
        "book_authorName": bookAuthorName,
        "book_publisherName": bookPublisherName,
        "book_ISBNcode": bookISBNcode,
        "book_publishDate": bookPublishDate!.toIso8601String(),
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

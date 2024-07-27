import 'dart:convert';

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
        createdDate: DateTime.parse(json["createDate"].toString()),
        lastUpdated: DateTime.parse(json["lastUpdate"].toString()),
        commercialActivated: json["commercialActivated"],
        chapterSellPrice: json["chapterSellPrice"]*1.0,
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

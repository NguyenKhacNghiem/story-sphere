import 'dart:convert';

List<FavBook> favBooksFromJson(String str) => List<FavBook>.from(json.decode(str).map((x) => FavBook.fromJson(x)));

FavBook favBookFromJson(String str) => FavBook.fromJson(json.decode(str));

String favBookToJson(FavBook data) => json.encode(data.toJson());

class FavBook {
  FavBook({
    this.favBookId,
    this.userId,
    this.storyId,
    this.readingProgressChapter,
    this.addedDate,
  });

  int? favBookId;
  int? userId;
  int? storyId;
  int? readingProgressChapter;
  DateTime? addedDate;

  factory FavBook.fromJson(Map<String, dynamic> json) => FavBook(
        favBookId: json["_id"],
        userId: json["userId"],
        storyId: json["storyId"],
        readingProgressChapter: json["readingProgressChapter"],
        addedDate: DateTime.parse(json["addedDate"]),
        
      );

  Map<String, dynamic> toJson() => {
        "favBookId": favBookId,
        "userId": userId,
        "storyId": storyId,
        "readingProgressChapter": readingProgressChapter,
        "addedDate": addedDate,
      };
}

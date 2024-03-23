import 'package:intl/intl.dart';
import 'package:interview_application/src/src.dart';

class CardItem {
  final String author;
  final int createdDate;
  final String image;
  final String title;
  final int liked;
  final int shared;
  final int comments;

  DateTime get date => DateTime.fromMillisecondsSinceEpoch(createdDate);

  String get created => DateFormat(dateTimeFormat).format(date);

  CardItem({
    required this.author,
    required this.createdDate,
    required this.image,
    required this.title,
    required this.liked,
    required this.shared,
    required this.comments,
  });

  factory CardItem.fromJson(Map<String, dynamic> json) {
    return CardItem(
      author: json["author"] != null ? json["author"] as String : "",
      createdDate: json["createdDate"] != null ? json["createdDate"] as int : 0,
      image: json["image"] != null ? json["image"] as String : "",
      title: json["title"] != null ? json["title"] as String : "",
      liked: json["liked"] != null ? json["liked"] as int : 0,
      shared: json["shared"] != null ? json["shared"] as int : 0,
      comments: json["comments"] != null ? json["comments"] as int : 0,
    );
  }
}

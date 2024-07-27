// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Comment {
  final String voterid;
  final String comment;

  Comment({
    required this.voterid, 
    required this.comment});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'commenterid': voterid,
      'comment': comment,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      voterid: map['voterid'] ?? '',
      comment: map['comment'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) => Comment.fromMap(json.decode(source));
}

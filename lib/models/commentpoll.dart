// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:honestpol/models/comment.dart';

class Commentpoll {
  final String pollid;
  final String userid;
  final String question;
  final String commentphoto;
  final String color;
  final String type;
  final List<Comment> comments;

  Commentpoll({
    required this.pollid, 
    required this.userid, 
    required this.question, 
    required this.commentphoto, 
    required this.comments,
    required this.color,
    required this.type
    });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pollid': pollid,
      'userid': userid,
      'question': question,
      'commentphoto': commentphoto,
      'color' : color,
      'type' : type,
      'comments': comments.map((x) => x.toMap()).toList(),
    };
  }

  factory Commentpoll.fromMap(Map<String, dynamic> map) {
    return Commentpoll(
      pollid: map['_id'] ?? '',
      color: map['color'] ?? '',
      userid: map['userid'] ?? '',
      question: map['question'] ?? '',
      commentphoto: map['commentphoto'] ?? '',
      type: map['type'] ?? '',
      comments: List<Comment>.from((map['comments']).map<Comment>((x) => Comment.fromMap(x),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Commentpoll.fromJson(String source) => Commentpoll.fromMap(json.decode(source));

  Commentpoll copyWith({
    String? pollid,
    String? color,
    String? userid,
    String? question,
    String? commentphoto,
    String? type,
    List<Comment>? comments,
  }) {
    return Commentpoll(
      pollid: pollid ?? this.pollid,
      color: color ?? this.color,
      userid: userid ?? this.userid,
      question: question ?? this.question,
      commentphoto: commentphoto ?? this.commentphoto,
      comments: comments ?? this.comments,
      type: type ?? this.type,
    );
  }
}

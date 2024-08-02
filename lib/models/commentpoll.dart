// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:honestpol/models/comment.dart';

class Commentpoll {
  final String pollid;
  final String userid;
  final String question;
  final String commentphoto;
  final String color;
  final String type;
  final List<Comment> comments;
  final List<String> likes;

  Commentpoll({
    required this.pollid, 
    required this.userid, 
    required this.question, 
    required this.commentphoto, 
    required this.comments,
    required this.color,
    required this.type,
    required this.likes,
    });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pollid': pollid,
      'userid': userid,
      'question': question,
      'commentphoto': commentphoto,
      'color' : color,
      'type' : type,
      'likes' : likes,
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
      likes: List<String>.from((map['likes'])),
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
    List<String>? likes,
    List<Comment>? comments,
  }) {
    return Commentpoll(
      pollid: pollid ?? this.pollid,
      color: color ?? this.color,
      userid: userid ?? this.userid,
      question: question ?? this.question,
      commentphoto: commentphoto ?? this.commentphoto,
      comments: comments ?? this.comments,
      likes: likes ?? this.likes,
      type: type ?? this.type,
    );
  }
}

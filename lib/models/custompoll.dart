// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:honestpol/models/comment.dart';
import 'package:honestpol/models/votes.dart';

class CustomPoll {

  String pollid;
  String userid;
  String type;
  String question;
  String customphoto;
  String color;
  List<String> options;
  List<Votes> votes;
  List<Comment> comments;
  List<String> likes;

  
  CustomPoll({
    required this.pollid,
    required this.userid,
    required this.type,
    required this.question,
    required this.customphoto,
    required this.options,
    required this.votes,
    required this.comments,
    required this.color,
    required this.likes,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pollid': pollid,
      'userid': userid,
      'type': type,
      'question': question,
      'customphoto': customphoto,
      'options': options,
      'color' : color,
      'likes' : likes,
      'votes': votes.map((x) => x.toMap()).toList(),
      'comments': comments.map((x) => x.toMap()).toList(),
    };
  }

  factory CustomPoll.fromMap(Map<String, dynamic> map) {
    return CustomPoll(
      pollid: map['_id'] ?? '',
      userid: map['userid'] ?? '',
      type: map['type'] ?? '',
      question: map['question'] ?? '',
      customphoto: map['customphoto'] ?? '',
      options: List<String>.from(map['options']),
      color: map['color'],
      likes: List<String>.from(map['likes']),
      votes: List<Votes>.from((map['votes']).map<Votes>((x) => Votes.fromMap(x as Map<String,dynamic>),),),
      comments: List<Comment>.from((map['comments']).map<Comment>((x) => Comment.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomPoll.fromJson(String source) => CustomPoll.fromMap(json.decode(source));
}

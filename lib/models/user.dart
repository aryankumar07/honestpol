// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String name;
  final String email;
  final String cid;
  final String status;
  final String token; 
  final String profilepic;
  final List<String> votes;
  final List<String> posts;
  final String id;
  final String bio;

  User({
    required this.email,
    required this.cid,
    required this.status,
    required this.token,
    required this.profilepic,
    required this.votes,
    required this.id,
    required this.name,
    required this.posts,
    required this.bio,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'cid': cid,
      'status': status,
      'token': token,
      'profilepic': profilepic,
      'votes': votes,
      'id': id,
      'name' : name,
      'posts' : posts,
      'bio' : bio
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] ?? '',
      cid: map['cid'] ?? '',
      status: map['status'] ?? '',
      token: map['token'] ?? '',
      profilepic: map['profilepic'] ?? '',
      votes: List<String>.from(map['votes']),
      id: map['_id'] ?? '',
      name : map['name'] ?? '',
      posts: List<String>.from(map['posts']),
      bio: map['bio'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? email,
    String? cid,
    String? status,
    String? token,
    String? profilepic,
    List<String>? votes,
    String? id,
    String? name,
    List<String>? posts,
    String? bio,
  }) {
    return User(
      email: email ?? this.email,
      cid: cid ?? this.cid,
      status: status ?? this.status,
      token: token ?? this.token,
      profilepic: profilepic ?? this.profilepic,
      votes: votes ?? this.votes,
      id: id ?? this.id,
      name: name ?? this.name,
      posts: posts ?? this.posts,
      bio : bio ?? this.bio,
    );
  }
}

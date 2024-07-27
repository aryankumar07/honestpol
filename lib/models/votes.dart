import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Votes {
  String voterid;
  String option;

  Votes({
    required this.voterid,
    required this.option,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'voterid': voterid,
      'option': option,
    };
  }

  factory Votes.fromMap(Map<String, dynamic> map) {
    return Votes(
      voterid: map['voterid'] ?? '',
      option: map['option'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Votes.fromJson(String source) => Votes.fromMap(json.decode(source));
}

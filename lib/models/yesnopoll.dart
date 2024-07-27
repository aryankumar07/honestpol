import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class YnPoll {
  String pollid;
  String userid;
  String question;
  String color;
  String type;
  List<String> yesvotes;
  List<String> novotes;

  
  YnPoll({
    required this.pollid,
    required this.userid,
    required this.question,
    required this.color,
    required this.yesvotes,
    required this.novotes,
    required this.type,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pollid': pollid,
      'userid': userid,
      'question': question,
      'color': color,
      'yesvotes': yesvotes,
      'novotes': novotes,
      'type' : type,
    };
  }

  factory YnPoll.fromMap(Map<String, dynamic> map) {
    return YnPoll(
      pollid: map['_id'] ?? '',
      userid: map['userid'] ?? '',
      question: map['question'] ?? '',
      color: map['color'] ?? '',
      type: map['type'] ?? '',
      yesvotes: List<String>.from(map['yesvotes']),
      novotes: List<String>.from((map['novotes']),
    ));
  }

  String toJson() => json.encode(toMap());

  factory YnPoll.fromJson(String source) => YnPoll.fromMap(json.decode(source));

  YnPoll copyWith({
    String? pollid,
    String? userid,
    String? question,
    String? color,
    String? type,
    List<String>? yesvotes,
    List<String>? novotes,
  }) {
    return YnPoll(
      pollid: pollid ?? this.pollid,
      userid: userid ?? this.userid,
      question: question ?? this.question,
      color: color ?? this.color,
      type: type ?? this.type,
      yesvotes: yesvotes ?? this.yesvotes,
      novotes: novotes ?? this.novotes,
    );
  }
}

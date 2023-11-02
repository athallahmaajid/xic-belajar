// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TaskModel {
  final String title;
  final String subject;
  final String desc;

  TaskModel({required this.title, required this.subject, required this.desc});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'subject': subject,
      'desc': desc,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'] as String,
      subject: map['subject'] as String,
      desc: map['desc'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

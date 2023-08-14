// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleModel {
  final String article;
  final Timestamp timestamp;
  ArticleModel({
    required this.article,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'article': article,
      'timestamp': timestamp,
    };
  }

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      article: (map['article'] ?? '') as String,
      timestamp: (map['timestamp']?? Timestamp(0, 0)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleModel.fromJson(String source) => ArticleModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

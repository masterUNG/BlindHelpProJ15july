// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleModel {
  final String article;
  final Timestamp timestamp;
  final String title;
  final String urlImage;

  ArticleModel({
    required this.article,
    required this.timestamp,
    required this.title,
    required this.urlImage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'article': article,
      'timestamp': timestamp,
      'title': title,
      'urlImage': urlImage,
    };
  }

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      article: (map['article'] ?? '') as String,
      timestamp: (map['timestamp']?? Timestamp(0, 0)),
      title: (map['title'] ?? '') as String,
      urlImage: (map['urlImage'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleModel.fromJson(String source) =>
      ArticleModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

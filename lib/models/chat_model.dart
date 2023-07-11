// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String message;
  final String nameSender;
  final String uidSender;
  final String urlSender;
  final Timestamp timestamp;
  ChatModel({
    required this.message,
    required this.nameSender,
    required this.uidSender,
    required this.urlSender,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'nameSender': nameSender,
      'uidSender': uidSender,
      'urlSender': urlSender,
      'timestamp': timestamp,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      message: (map['message'] ?? '') as String,
      nameSender: (map['nameSender'] ?? '') as String,
      uidSender: (map['uidSender'] ?? '') as String,
      urlSender: (map['urlSender'] ?? '') as String,
      timestamp: (map['timestamp'] ?? Timestamp(0, 0)),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) => ChatModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

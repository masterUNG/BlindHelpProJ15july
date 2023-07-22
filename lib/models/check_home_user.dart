// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class CheckHomeUser {
  final Timestamp recordTimestamp;
  final Map<String, dynamic> mapUser;
  CheckHomeUser({
    required this.recordTimestamp,
    required this.mapUser,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'recordTimestamp': recordTimestamp,
      'mapUser': mapUser,
    };
  }


  factory CheckHomeUser.fromMap(Map<String, dynamic> map) {
    return CheckHomeUser(
      recordTimestamp: (map['recordTimestamp'] ?? Timestamp(0, 0)),
      mapUser: Map<String, dynamic>.from(map['mapUser'] ?? {}),
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckHomeUser.fromJson(String source) => CheckHomeUser.fromMap(json.decode(source) as Map<String, dynamic>);
}

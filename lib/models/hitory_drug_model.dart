// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryDrugModel {
  final String historyDrug;
  final Timestamp timestamp;
  HistoryDrugModel({
    required this.historyDrug,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'historyDrug': historyDrug,
      'timestamp': timestamp,
    };
  }

  factory HistoryDrugModel.fromMap(Map<String, dynamic> map) {
    return HistoryDrugModel(
      historyDrug: (map['historyDrug'] ?? '') as String,
      timestamp: (map['timestamp'] ?? Timestamp(0, 0)),
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryDrugModel.fromJson(String source) => HistoryDrugModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class DiseaseModel {
  final String disease;
  final Timestamp timestamp;
  DiseaseModel({
    required this.disease,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'disease': disease,
      'timestamp': timestamp,
    };
  }

  factory DiseaseModel.fromMap(Map<String, dynamic> map) {
    return DiseaseModel(
      disease: (map['disease'] ?? '') as String,
      timestamp: (map['timestamp'] ?? Timestamp(0, 0)),
    );
  }

  String toJson() => json.encode(toMap());

  factory DiseaseModel.fromJson(String source) => DiseaseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

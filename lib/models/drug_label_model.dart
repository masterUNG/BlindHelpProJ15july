// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class DrugLabelModel {
  final String urlLabel;
  final String textLabel;
  final Timestamp timestamp;
  final Map<String, dynamic> mapUserModel;
  final Map<String, dynamic> mapHelperModel;
  DrugLabelModel({
    required this.urlLabel,
    required this.textLabel,
    required this.timestamp,
    required this.mapUserModel,
    required this.mapHelperModel,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'urlLabel': urlLabel,
      'textLabel': textLabel,
      'timestamp': timestamp,
      'mapUserModel': mapUserModel,
      'mapHelperModel': mapHelperModel,
    };
  }

  factory DrugLabelModel.fromMap(Map<String, dynamic> map) {
    return DrugLabelModel(
      urlLabel: (map['urlLabel'] ?? '') as String,
      textLabel: (map['textLabel'] ?? '') as String,
      timestamp: (map['timestamp']  ?? Timestamp(0, 0)),
      mapUserModel: Map<String, dynamic>.from((map['mapUserModel'] ?? {})),
      mapHelperModel: Map<String, dynamic>.from((map['mapHelperModel'] ?? {})),
    );
  }

  String toJson() => json.encode(toMap());

  factory DrugLabelModel.fromJson(String source) => DrugLabelModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

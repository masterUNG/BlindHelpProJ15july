// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NameThModel {
  final String id;
  final String name_th;
  NameThModel({
    required this.id,
    required this.name_th,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name_th': name_th,
    };
  }

  factory NameThModel.fromMap(Map<String, dynamic> map) {
    return NameThModel(
      id: (map['id'] ?? '') as String,
      name_th: (map['name_th'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NameThModel.fromJson(String source) => NameThModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

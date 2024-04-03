import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CustomerModel extends Equatable {
  int id;
  String name;
  String description;
  DateTime createdAt;

  CustomerModel({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
  });
  factory CustomerModel.empty() {
    return CustomerModel(
        id: 0, name: "", description: "", createdAt: DateTime.now());
  }
  CustomerModel copyWith({
    int? id,
    String? name,
    String? description,
    DateTime? createdAt,
  }) {
    return CustomerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [id, name, description, createdAt];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) =>
      CustomerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}

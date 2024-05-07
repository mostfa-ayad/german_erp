// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class CustomerServiceModel implements Equatable {
  final int id;

  final DateTime createdAt;
  final String customerName;
  final String phone;
  final String secondaryPhone;
  final String address;
  final String description;
  final bool isComplete;

  CustomerServiceModel({
    required this.id,
    required this.createdAt,
    required this.customerName,
    required this.phone,
    required this.secondaryPhone,
    required this.address,
    required this.description,
    required this.isComplete,
  });

  CustomerServiceModel copyWith({
    int? id,
    String? userId, // New field
    DateTime? createdAt,
    String? customerName,
    String? phone,
    String? secondaryPhone,
    String? address,
    String? description,
    bool? isComplete,
    String? employeeName,
  }) {
    return CustomerServiceModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      customerName: customerName ?? this.customerName,
      phone: phone ?? this.phone,
      secondaryPhone: secondaryPhone ?? this.secondaryPhone,
      address: address ?? this.address,
      description: description ?? this.description,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  factory CustomerServiceModel.empty() {
    return CustomerServiceModel(
      id: 0,
      createdAt: DateTime.now(),
      customerName: '',
      phone: '',
      secondaryPhone: '',
      address: '',
      description: '',
      isComplete: false,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'customer_name': customerName,
      'phone': phone,
      'secondary_phone': secondaryPhone,
      'address': address,
      'description': description,
      'is_complete': isComplete,
    };
  }

  factory CustomerServiceModel.fromMap(Map<String, dynamic> map) {
    return CustomerServiceModel(
      id: map['id'] as int,
      createdAt: DateTime.parse(map['created_at'] as String),
      customerName: map['customer_name'] as String,
      phone: map['phone'] as String,
      secondaryPhone: map['secondary_phone'] as String,
      address: map['address'] as String,
      description: map['description'] as String,
      isComplete: map['is_complete'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerServiceModel.fromJson(String source) =>
      CustomerServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CustomerServiceModel(id: $id, createdAt: $createdAt, customerName: $customerName, phone: $phone, secondaryPhone: $secondaryPhone, address: $address, description: $description, isComplete: $isComplete)';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        createdAt,
        customerName,
        phone,
        secondaryPhone,
        address,
        description,
        isComplete,
      ];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}

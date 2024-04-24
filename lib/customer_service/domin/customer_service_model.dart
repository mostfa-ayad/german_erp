// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class CustomerServiceModel implements Equatable {
  final int id;
  final String userId; // New field
  final DateTime createdAt;
  final String customerName;
  final String phone;
  final String secondaryPhone;
  final String address;
  final String description;
  final bool isComplete;
  final String employeeName;

  CustomerServiceModel({
    required this.id,
    required this.userId, // New field
    required this.createdAt,
    required this.customerName,
    required this.phone,
    required this.secondaryPhone,
    required this.address,
    required this.description,
    required this.isComplete,
    required this.employeeName,
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
      userId: userId ?? this.userId, // New field
      createdAt: createdAt ?? this.createdAt,
      customerName: customerName ?? this.customerName,
      phone: phone ?? this.phone,
      secondaryPhone: secondaryPhone ?? this.secondaryPhone,
      address: address ?? this.address,
      description: description ?? this.description,
      isComplete: isComplete ?? this.isComplete,
      employeeName: employeeName ?? this.employeeName,
    );
  }

  factory CustomerServiceModel.empty() {
    return CustomerServiceModel(
      id: 0,
      userId: '', // New field
      createdAt: DateTime.now(),
      customerName: '',
      phone: '',
      secondaryPhone: '',
      address: '',
      description: '',
      isComplete: false,
      employeeName: '',
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
      'employee_name': employeeName,
    };
  }

  factory CustomerServiceModel.fromMap(Map<String, dynamic> map) {
    print(map);
    return CustomerServiceModel(
      id: map['id'] as int,
      userId: map['user_id'] as String, // New field
      createdAt: DateTime.parse(map['created_at'] as String),
      customerName: map['customer_name'] as String,
      phone: map['phone'] as String,
      secondaryPhone: map['secondary_phone'] as String,
      address: map['address'] as String,
      description: map['description'] as String,
      isComplete: map['is_complete'] as bool,
      employeeName: map['employee_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerServiceModel.fromJson(String source) =>
      CustomerServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CustomerServiceModel(id: $id, userId: $userId, createdAt: $createdAt, customerName: $customerName, phone: $phone, secondaryPhone: $secondaryPhone, address: $address, description: $description, isComplete: $isComplete, employeeName: $employeeName)';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        userId, // New field
        createdAt,
        customerName,
        phone,
        secondaryPhone,
        address,
        description,
        isComplete,
        employeeName,
      ];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}

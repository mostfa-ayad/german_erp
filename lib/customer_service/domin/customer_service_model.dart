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
  final String employeeName;

  CustomerServiceModel({
    required this.id,
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
      employeeName: employeeName ?? this.employeeName,
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
      employeeName: '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'customerName': customerName,
      'phone': phone,
      'secondaryPhone': secondaryPhone,
      'address': address,
      'description': description,
      'isComplete': isComplete,
      'employeeName': employeeName,
    };
  }

  factory CustomerServiceModel.fromMap(Map<String, dynamic> map) {
    return CustomerServiceModel(
      id: map['id'] as int,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      customerName: map['customerName'] as String,
      phone: map['phone'] as String,
      secondaryPhone: map['secondaryPhone'] as String,
      address: map['address'] as String,
      description: map['description'] as String,
      isComplete: map['isComplete'] as bool,
      employeeName: map['employeeName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerServiceModel.fromJson(String source) =>
      CustomerServiceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CustomerServiceModel(id: $id, createdAt: $createdAt, customerName: $customerName, phone: $phone, secondaryPhone: $secondaryPhone, address: $address, description: $description, isComplete: $isComplete, employeeName: $employeeName)';
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
        employeeName,
      ];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}

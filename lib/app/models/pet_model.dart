// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class PetModel {
  final String? id;
  final String image;
  final String imageURL;
  final String name;
  final String description;
  final String status;
  final String address;
  final String telephoneNumber;

  PetModel({
    this.id,
    required this.image,
    required this.imageURL,
    required this.name,
    required this.description,
    required this.status,
    required this.address,
    required this.telephoneNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'imageURL': imageURL,
      'name': name,
      'description': description,
      'status': status,
      'locale': address,
      'contact': telephoneNumber,
    };
  }

  factory PetModel.fromMap(Map<String, dynamic> map) {
    return PetModel(
      id: map['id'] as String,
      image: map['image'] as String,
      imageURL: map['imageURL'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      status: map['status'] as String,
      address: map['address'] as String,
      telephoneNumber: map['telephoneNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  static PetModel fromJson(Map<String, dynamic> json) => PetModel(
        image: json['image'],
        imageURL: json['imageURL'],
        name: json['name'],
        description: json['description'],
        status: json['status'],
        address: json['locale'],
        telephoneNumber: json['contact'],
      );

  factory PetModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return PetModel(
      id: document.id,
      image: data['image'],
      imageURL: data['imageURL'],
      name: data['name'],
      description: data['description'],
      status: data['status'],
      address: data['locale'],
      telephoneNumber: data['contact'],
    );
  }
}

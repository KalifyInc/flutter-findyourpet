// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class PetModel {
  final String image;
  final String imageURL;
  final String name;
  final String description;
  final String status;
  final String address;
  final String telephoneNumber;
  final String createdAt;

  PetModel({
    required this.image,
    required this.imageURL,
    required this.name,
    required this.description,
    required this.status,
    required this.address,
    required this.telephoneNumber,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'imageURL': imageURL,
      'name': name,
      'description': description,
      'status': status,
      'locale': address,
      'contact': telephoneNumber,
      'createdAt': createdAt,
    };
  }

  factory PetModel.fromMap(Map<String, dynamic> map) {
    return PetModel(
      image: map['image'] as String,
      imageURL: map['imageURL'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      status: map['status'] as String,
      address: map['address'] as String,
      telephoneNumber: map['telephoneNumber'] as String,
      createdAt: map['createdAt'] as String,
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
        createdAt: json['createdAt'],
      );

  static PetModel fromSnapshot(DocumentSnapshot document) {
    return PetModel(
      image: document['image'],
      imageURL: document['imageURL'],
      name: document['name'],
      description: document['description'],
      status: document['status'],
      address: document['locale'],
      telephoneNumber: document['contact'],
      createdAt: document['createdAt'],
    );
  }
}

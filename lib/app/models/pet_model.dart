// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PetModel {
  final String id;
  final String image;
  final String name;
  final String description;
  final String status;
  final String address;
  final String telephoneNumber;

  PetModel({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.status,
    required this.address,
    required this.telephoneNumber,
  });

  PetModel copyWith({
    String? id,
    String? image,
    String? name,
    String? description,
    String? status,
    String? address,
    String? telephoneNumber,
  }) {
    return PetModel(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      description: description ?? this.description,
      status: status ?? this.status,
      address: address ?? this.address,
      telephoneNumber: telephoneNumber ?? this.telephoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
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
      name: map['name'] as String,
      description: map['description'] as String,
      status: map['status'] as String,
      address: map['address'] as String,
      telephoneNumber: map['telephoneNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PetModel.fromJson(String source) =>
      PetModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PetModel(id: $id, image: $image, name: $name, description: $description, status: $status, address: $address, telephoneNumber: $telephoneNumber)';
  }

  @override
  bool operator ==(covariant PetModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.image == image &&
        other.name == name &&
        other.description == description &&
        other.status == status &&
        other.address == address &&
        other.telephoneNumber == telephoneNumber;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        image.hashCode ^
        name.hashCode ^
        description.hashCode ^
        status.hashCode ^
        address.hashCode ^
        telephoneNumber.hashCode;
  }
}

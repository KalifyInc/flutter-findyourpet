// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PetModel {
  PetModel({
    required this.photoPet,
    required this.namePet,
    required this.situation,
    required this.address,
    required this.description,
    required this.telephoneNumber,
  });

  final String photoPet;
  final String namePet;
  final String situation;
  final String address;
  final String description;
  final String telephoneNumber;

  PetModel copyWith({
    String? photoPet,
    String? namePet,
    String? situation,
    String? address,
    String? description,
    String? telephoneNumber,
  }) {
    return PetModel(
      photoPet: photoPet ?? this.photoPet,
      namePet: namePet ?? this.namePet,
      situation: situation ?? this.situation,
      address: address ?? this.address,
      description: description ?? this.description,
      telephoneNumber: telephoneNumber ?? this.telephoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'photoPet': photoPet,
      'namePet': namePet,
      'situation': situation,
      'address': address,
      'description': description,
      'telephoneNumber': telephoneNumber,
    };
  }

  factory PetModel.fromMap(Map<String, dynamic> map) {
    return PetModel(
      photoPet: map['photoPet'] as String,
      namePet: map['namePet'] as String,
      situation: map['situation'] as String,
      address: map['address'] as String,
      description: map['description'] as String,
      telephoneNumber: map['telephoneNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PetModel.fromJson(String source) =>
      PetModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PetModel(photoPet: $photoPet, namePet: $namePet, situation: $situation, address: $address, description: $description, telephoneNumber: $telephoneNumber)';
  }

  @override
  bool operator ==(covariant PetModel other) {
    if (identical(this, other)) return true;

    return other.photoPet == photoPet &&
        other.namePet == namePet &&
        other.situation == situation &&
        other.address == address &&
        other.description == description &&
        other.telephoneNumber == telephoneNumber;
  }

  @override
  int get hashCode {
    return photoPet.hashCode ^
        namePet.hashCode ^
        situation.hashCode ^
        address.hashCode ^
        description.hashCode ^
        telephoneNumber.hashCode;
  }
}

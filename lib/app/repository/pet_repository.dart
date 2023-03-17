import 'package:FindYourPet/app/models/pet_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class PetRepository {
  final _db = FirebaseFirestore.instance;

  final FirebaseStorage storage = FirebaseStorage.instance;

  // Store user in FireStore
  createPet(PetModel pet) async {
    await _db
        .collection('pets')
        .add(pet.toMap())
        .whenComplete(() => 'Enviado!')
        .catchError((error, stackTrace) {
      throw Exception('Erro: ${error.toString()}');
    });
  }

  // Future<List<PetModel>> getAllPets() async {
  //   final snapshot = await _db.collection('pets').get();

  //   final petData = snapshot.docs.map((e) => PetModel.fromSnapshot(e)).toList();
  //   return petData;
  // }

  Future<List<PetModel>> getAllPets() async {
    final snapshot = await _db
        .collection('pets')
        .orderBy('createdAt', descending: true)
        .get();

    final petData = snapshot.docs.map((e) => PetModel.fromSnapshot(e)).toList();
    return petData;
  }

  Stream<QuerySnapshot> getPetsSnapshot() {
    final snapshot = _db.collection('pets').snapshots();

    return snapshot;
  }
}

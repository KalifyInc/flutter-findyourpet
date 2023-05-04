import 'package:FindYourPet/app/models/pet_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PetRepository {
  final _db = FirebaseFirestore.instance;

  final FirebaseStorage storage = FirebaseStorage.instance;

  // Store user in FireStore
  createPet(PetModel pet) async {
    await _db.collection('pets').add(pet.toMap());
  }

  Query<Map<String, dynamic>> query() {
    final query = _db.collection('pets').orderBy('createdAt');
    return query;
  }

  Future<List<PetModel>> getAllPets() async {
    final snapshot = await _db
        .collection('pets')
        .orderBy('createdAt')
        .get();

    final petData = snapshot.docs.map((e) => PetModel.fromSnapshot(e)).toList();
    return petData;
  }
}

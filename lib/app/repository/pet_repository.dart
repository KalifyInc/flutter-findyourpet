import 'package:FindYourPet/app/models/pet_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PetRepository extends GetxController {
  static PetRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  final FirebaseStorage storage = FirebaseStorage.instance;

  // Store user in FireStore
  createPet(PetModel pet) async {
    await _db
        .collection('pets')
        .add(pet.toMap())
        .whenComplete(() => Get.snackbar('Success', 'Formulário enviado!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white))
        .catchError((error, stackTrace) {
      Get.snackbar('Error', 'Tente novamente!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);

      debugPrint(error.toString());
    });
  }

  Future<List<PetModel>> getAllPets() async {
    final snapshot = await _db.collection('pets').get();

    final petData = snapshot.docs.map((e) => PetModel.fromSnapshot(e)).toList();
    return petData;
  }

  Future<String> getDownloadURL(String imageName) async {
    String downloadURL = await storage.ref('files/$imageName').getDownloadURL();
    print(downloadURL);
    return downloadURL;
  }
}

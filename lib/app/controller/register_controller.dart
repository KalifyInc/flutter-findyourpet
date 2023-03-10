import 'dart:io';

import 'package:FindYourPet/app/repository/pet_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../models/pet_model.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  final formKey = GlobalKey<FormState>();
  List? image;
  String? imageURL;
  String? status;
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController telephoneNumber = TextEditingController();

  final petRepository = Get.put(PetRepository());

  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> createPet(PetModel pet) async {
    await petRepository.createPet(pet);
    clearForm();
  }

  XFile getImage() {
    XFile imageFile = image!.single;
    return imageFile;
  }

  String? validateInput(value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório!';
    }
    return null;
  }

  void clearForm() {
    formKey.currentState?.reset();

    name.clear();
    description.clear();
    address.clear();
    telephoneNumber.clear();
  }

  void submitForm() async {
    XFile imageFile = getImage();
    File file = File(imageFile.path);

    try {
      // String ref = 'files/img-${DateTime.now().toString()}.png';
      String ref = 'files/${imageFile.name}';
      //storage thefile on storage Firebase
      await storage.ref(ref).putFile(file);
      // get the download url from storageFirebase
      imageURL = await storage.ref(ref).getDownloadURL();
    } on FirebaseException catch (e) {
      throw Exception('Erro no upload ${e.code}');
    }

    final pet = PetModel(
      image: imageFile.name,
      imageURL: imageURL.toString(),
      name: name.text,
      description: description.text,
      status: status.toString(),
      address: address.text,
      telephoneNumber: telephoneNumber.text,
    );

    RegisterController.instance.createPet(pet);
  }
}

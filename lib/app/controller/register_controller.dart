import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/pet_model.dart';

class RegisterController {
  final formKey = GlobalKey<FormState>();
  List? image;
  String? status;
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController telephoneNumber = TextEditingController();

  final FirebaseStorage storage = FirebaseStorage.instance;

  final _reference = FirebaseFirestore.instance.collection('pets');
  final _referenceId = FirebaseFirestore.instance.collection('pets').doc();

  XFile getImage() {
    XFile imageFile = image!.single;
    return imageFile;
  }

  Future<void> uploadImage(String path) async {
    File file = File(path);
    XFile imageFile = getImage();

    try {
      // String ref = 'files/img-${DateTime.now().toString()}.png';
      String ref = 'files/${imageFile.name}';
      await storage.ref(ref).putFile(file);
    } on FirebaseException catch (e) {
      throw Exception('Erro no upload ${e.code}');
    }
  }

  Future<void> pickandUploadImage() async {
    XFile file = getImage();

    await uploadImage(file.path);
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
    XFile file = getImage();

    final pet = PetModel(
      id: _referenceId.id,
      image: file.name,
      name: name.text,
      description: description.text,
      status: status.toString(),
      address: address.text,
      telephoneNumber: telephoneNumber.text,
    );
    final dataToSend = pet.toMap();

    pickandUploadImage();
    _reference.add(dataToSend);
  }
}

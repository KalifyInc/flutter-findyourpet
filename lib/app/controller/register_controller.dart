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

  Future<void> upload(String path) async {
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

  Future<void> pickandUpload() async {
    XFile file = getImage();

    await upload(file.path);
  }

  String? validateInput(value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório!';
    }
    return null;
  }

  void clearForm() {
    return formKey.currentState?.reset();
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

    pickandUpload();
    _reference.add(dataToSend);
  }
}

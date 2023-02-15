import 'package:flutter/material.dart';

import '../models/pet_model.dart';

class RegisterController {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  // PetModel petModel = PetModel();

  String? validateInput(value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório!';
    }
    return null;
  }

  void submitForm() async {
    isLoading = true;
    // StorageController();

    // Navigator.pop(context);
  }
}

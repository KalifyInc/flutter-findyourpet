import 'package:flutter/material.dart';

class RegisterController {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController photoPet = TextEditingController();
  final TextEditingController namePet = TextEditingController();
  final TextEditingController situation = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController telephoneNumber = TextEditingController();

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
    isLoading = true;
    // StorageController();

    // Navigator.pop(context);
  }
}

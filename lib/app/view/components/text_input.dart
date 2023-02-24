import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../controller/register_controller.dart';

class TextInput extends StatefulWidget {
  TextInput(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.maxLength,
      this.keyboardType});
  final String hintText;
  final TextEditingController controller;
  final int maxLength;
  final TextInputType? keyboardType;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final controller = RegisterController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // The validator receives the text that the user has entered.
      validator: (value) => controller.validateInput(value),
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
          border: const OutlineInputBorder(), hintText: widget.hintText),
    );
  }
}

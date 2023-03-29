import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../controller/register_controller.dart';

class TextInputForm extends StatefulWidget {
  const TextInputForm(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.maxLength,
      this.maxLines,
      this.keyboardType});
  final String hintText;
  final TextEditingController controller;
  final int maxLength;
  final int? maxLines;
  final TextInputType? keyboardType;

  @override
  State<TextInputForm> createState() => _TextInputFormState();
}

class _TextInputFormState extends State<TextInputForm> {
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
      maxLines: widget.maxLines,
      decoration: InputDecoration(
          border: const OutlineInputBorder(), hintText: widget.hintText),
    );
  }
}

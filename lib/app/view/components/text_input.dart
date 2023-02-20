import 'package:flutter/material.dart';

import '../../controller/register_controller.dart';

class TextInput extends StatefulWidget {
  const TextInput({super.key});

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
      decoration: const InputDecoration(border: OutlineInputBorder()),
    );
  }
}

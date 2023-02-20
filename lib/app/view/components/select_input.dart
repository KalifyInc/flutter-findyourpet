import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

import '../../controller/register_controller.dart';

class SelectInput extends StatefulWidget {
  const SelectInput({super.key});

  @override
  State<SelectInput> createState() => _SelectInputState();
}

class _SelectInputState extends State<SelectInput> {
  final controller = RegisterController();

  final List<Map<String, dynamic>> _items = [
    {
      'value': '',
      'label': '',
    },
    {
      'value': 'perdido',
      'label': 'Perdido',
    },
    {
      'value': 'encontrado',
      'label': 'Encontrado',
    },
    {
      'value': 'adoção',
      'label': 'Adoção',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SelectFormField(
      type: SelectFormFieldType.dropdown,
      items: _items,
      onChanged: (value) => controller.validateInput(value),
      onSaved: (value) => controller.validateInput(value),
      validator: (value) => controller.validateInput(value),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.arrow_drop_down),
      ),
    );
  }
}

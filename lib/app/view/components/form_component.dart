import 'package:flutter/material.dart';
import 'package:mobile_find_your_pet/app/controller/register_controller.dart';
import 'package:mobile_find_your_pet/app/view/components/subtitle.dart';

class FormComponent extends StatefulWidget {
  const FormComponent({super.key});

  @override
  State<FormComponent> createState() => _FormComponentState();
}

class _FormComponentState extends State<FormComponent> {
  final controller = RegisterController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: <Widget>[
          const SubTitle(title: 'FOTO DO ANIMAL'),
          const SubTitle(title: 'NOME DO ANIMAL'),
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) => controller.validateInput(value),
            // onSaved: ,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              // hintText: 'Enter a search term',
            ),
          ),
          const SubTitle(title: 'QUAL É A SITUAÇÃO?'),
          const SubTitle(title: 'CIDADE DO ANIMAL'),
          const SubTitle(title: 'BAIRRO DO ANIMAL'),
          const SubTitle(title: 'DESCRIÇÃO DO ANIMAL'),
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) => controller.validateInput(value),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              // hintText: 'Enter a search term',
            ),
          ),
          const SubTitle(title: 'NÚMERO DE TELEFONE'),
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) => controller.validateInput(value),
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            children: [
              // ElevatedButton(
              //   onPressed: () => Form.clear(),
              //   child: const Text('LIMPAR'),
              // ),
              if (controller.isLoading)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (controller.formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      controller.submitForm();
                    }
                  },
                  child: const Text('ENVIAR'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

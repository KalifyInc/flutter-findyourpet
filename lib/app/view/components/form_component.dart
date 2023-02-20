import 'package:flutter/material.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:mobile_find_your_pet/app/controller/register_controller.dart';
import 'package:mobile_find_your_pet/app/view/components/select_input.dart';
import 'package:mobile_find_your_pet/app/view/components/subtitle.dart';
import 'package:mobile_find_your_pet/app/view/components/text_input.dart';

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SubTitle(title: 'FOTO DO ANIMAL'),
          FormBuilderImagePicker(
            name: 'photos',
            placeholderWidget: const Icon(Icons.photo_library),
            fit: BoxFit.fill,
            maxImages: 1,
            onChanged: (value) => controller.validateInput(value),
            onSaved: (value) => controller.validateInput(value),
            validator: (value) => controller.validateInput(value),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
          const SizedBox(height: 14),
          const SubTitle(title: 'NOME DO ANIMAL'),
          const SizedBox(height: 14),
          const TextInput(),
          const SizedBox(height: 14),
          const SubTitle(title: 'QUAL É A SITUAÇÃO?'),
          const SizedBox(height: 14),
          const SelectInput(),
          const SizedBox(height: 14),
          const SubTitle(title: 'ENDEREÇO DO ANIMAL'),
          const SizedBox(height: 14),
          const TextInput(),
          const SizedBox(height: 14),
          const SubTitle(title: 'DESCRIÇÃO DO ANIMAL'),
          const SizedBox(height: 14),
          const TextInput(),
          const SizedBox(height: 14),
          const SubTitle(title: 'NÚMERO DE TELEFONE'),
          const SizedBox(height: 14),
          const TextInput(),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => controller.clearForm(),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 224, 209, 67) // background (button) color
                    ),
                child: const Text('LIMPAR'),
              ),
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

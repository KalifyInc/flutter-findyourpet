import 'package:FindYourPet/app/view/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:FindYourPet/app/controller/register_controller.dart';
import 'package:FindYourPet/app/view/widgets/subtitle.dart';

import 'global_snackbar_widget.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final controller = RegisterController();
  String? dropdownValue;

  static const List<String> listItems = <String>[
    'Perdido',
    'Encontrado',
    'Adoção'
  ];

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controller.address.dispose();
    controller.description.dispose();
    controller.name.dispose();
    controller.telephoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SubTitle(title: 'FOTO DO ANIMAL'),
          const SizedBox(height: 14),
          Center(
            child: SizedBox(
              width: 200,
              child: FormBuilderImagePicker(
                name: 'photos',
                placeholderWidget: const Card(
                  child: Icon(Icons.photo_library),
                ),
                fit: BoxFit.cover,
                maxImages: 1,
                validator: (value) => controller.validateInput(value),
                onSaved: (newValue) => controller.image = newValue,
                decoration: const InputDecoration(border: InputBorder.none),
                transformImageWidget: (context, displayImage) => Card(
                  clipBehavior: Clip.antiAlias,
                  child: SizedBox.expand(
                    child: displayImage,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          const SubTitle(title: 'NOME DO ANIMAL'),
          const SizedBox(height: 14),
          TextInputForm(
            controller: controller.name,
            maxLength: 15,
            hintText: 'Nome do Animalzinho',
          ),
          const SizedBox(height: 14),
          const SubTitle(title: 'DESCRIÇÃO DO ANIMAL'),
          const SizedBox(height: 14),
          TextInputForm(
            controller: controller.description,
            maxLength: 50,
            maxLines: 4,
            hintText: 'Cachorro pequeno, pelo branco...',
          ),
          const SizedBox(height: 14),
          const SubTitle(title: 'QUAL É A SITUAÇÃO?'),
          const SizedBox(height: 14),
          DropdownButtonFormField<String>(
            isExpanded: true,
            icon: const Icon(Icons.arrow_drop_down),
            decoration: const InputDecoration(border: OutlineInputBorder()),
            validator: (value) => controller.validateInput(value),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value;
              });
            },
            onSaved: (newValue) => controller.status = newValue,
            items: listItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const SizedBox(height: 14),
          const SubTitle(title: 'ENDEREÇO DO ANIMAL'),
          const SizedBox(height: 14),
          TextInputForm(
            controller: controller.address,
            maxLength: 20,
            hintText: 'Seu bairro e cidade',
          ),
          const SizedBox(height: 14),
          const SubTitle(title: 'NÚMERO DE TELEFONE'),
          const SizedBox(height: 14),
          TextInputForm(
            controller: controller.telephoneNumber,
            maxLength: 11,
            keyboardType: TextInputType.phone,
            hintText: '00912345678',
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => controller.clearForm(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 224, 209, 67),
                ),
                child: const Text('LIMPAR'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (controller.formKey.currentState!.validate()) {
                    controller.formKey.currentState!.save();
                    try {
                      // If the form is valid,save the information in a database.
                      controller.submitForm();

                      GlobalSnackBarWidget.show(context, 'Carregando...',
                          const Color.fromARGB(255, 212, 195, 42));
                    } catch (e) {
                      GlobalSnackBarWidget.show(
                          context, 'Erro: ${e.toString()}', Colors.redAccent);
                    } finally {
                      GlobalSnackBarWidget.show(
                          context, 'Enviado!', Colors.green);
                    }
                  } else {
                    GlobalSnackBarWidget.show(
                        context, 'Preencha todos os campos!', Colors.redAccent);
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

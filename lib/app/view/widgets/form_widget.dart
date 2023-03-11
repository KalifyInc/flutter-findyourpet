import 'package:FindYourPet/app/view/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:FindYourPet/app/controller/register_controller.dart';
import 'package:FindYourPet/app/view/widgets/subtitle.dart';
import 'package:get/get.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final controller = Get.put(RegisterController());
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
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (controller.formKey.currentState!.validate()) {
                    controller.formKey.currentState!.save();

                    // If the form is valid,save the information in a database.
                    controller.submitForm();
                  } else {
                    Get.snackbar('Atenção!', 'Preencha todos os campos!',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.redAccent,
                        colorText: Colors.white);
                  }
                },
                child: const Text('ENVIAR'),
              ),
              ElevatedButton(
                onPressed: () => controller.clearForm(),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 224, 209, 67) // background (button) color
                    ),
                child: const Text('LIMPAR'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

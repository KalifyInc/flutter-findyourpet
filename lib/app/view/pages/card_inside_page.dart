import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:FindYourPet/app/view/widgets/subtitle.dart';

import '../../controller/whatsapp_controller.dart';

class CardInsidePage extends StatefulWidget {
  CardInsidePage(
      {super.key,
      this.image,
      required this.imageURL,
      required this.name,
      required this.status,
      required this.description,
      required this.telephone,
      required this.map});
  String? image;
  String imageURL;
  String name;
  String status;
  String description;
  String telephone;
  String map;

  @override
  State<CardInsidePage> createState() => _CardInsidePageState();
}

class _CardInsidePageState extends State<CardInsidePage> {
  final whatsappController = WhatsAppController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    // border: Border(color: Colors.black),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.imageURL)))),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.location_pin, size: 16),
                      label: Text(
                        'Está na região de: ${widget.map}',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const SizedBox(height: 12),
                        const SubTitle(
                          title: 'Situação do animal',
                        ),
                        Text(widget.status),
                        const SizedBox(height: 12),
                        const SubTitle(title: 'Descrição'),
                        Text(widget.description),
                        const SizedBox(height: 24),
                        Center(
                          child: TextButton.icon(
                            icon: const FaIcon(
                              FontAwesomeIcons.whatsapp,
                              size: 18,
                            ),
                            label: const Text('ENTRAR EM CONTATO',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  // fontWeight: FontWeight.w600,
                                )),
                            style: TextButton.styleFrom(
                              // fixedSize: const Size(10, 50),
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () async {
                              try {
                                await whatsappController.openWhatsapp(
                                    context: context,
                                    telephoneNumber: widget.telephone);
                              } catch (e) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    'Erro: ${e.toString()}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.redAccent,
                                ));
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}

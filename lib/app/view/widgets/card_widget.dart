import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../controller/whatsapp_controller.dart';
import '../../repository/pet_repository.dart';
import '../pages/card_inside_page.dart';

class CardWidget extends StatefulWidget {
  CardWidget(
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
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  final petRepository = Get.put(PetRepository());
  final whatsappController = Get.put(WhatsAppController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.tealAccent,
          onTap: () {
            debugPrint('Card tapped.');
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CardInsidePage(
                        imageURL: widget.imageURL,
                        name: widget.name,
                        status: widget.status,
                        description: widget.description,
                        map: widget.map,
                        telephone: widget.telephone,
                      )),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Container(
                    width: 60,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        // border: Border(color: Colors.black),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(widget.imageURL)))),
                // leading:
                //     Image.network(widget.imageURL, fit: BoxFit.fill, width: 60),
                title: Text('${widget.name} - ${widget.status}'),
                subtitle: Text(widget.description),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const SizedBox(width: 6),
                  TextButton.icon(
                    icon: const FaIcon(
                      FontAwesomeIcons.whatsapp,
                      size: 16,
                    ),
                    label: Text(widget.telephone),
                    onPressed: () async {
                      /* ... */
                      await whatsappController.openWhatsapp(
                          context: context, telephoneNumber: widget.telephone);
                    },
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.location_pin, size: 16),
                    label: Text(widget.map),
                  ),
                  const SizedBox(width: 6),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

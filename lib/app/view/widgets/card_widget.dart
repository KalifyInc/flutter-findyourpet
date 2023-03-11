import 'package:flutter/material.dart';
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
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ListTile(
                leading: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.imageURL)))),
                title: Text('${widget.name} - ${widget.status}'),
                // subtitle: Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(widget.description),
                //     Padding(
                //       padding: const EdgeInsets.only(right: 32.0),
                //       child: TextButton.icon(
                //         onPressed: () {},
                //         icon: const Icon(Icons.location_pin, size: 16),
                //         label: Text(widget.map),
                //       ),
                //     ),
                //   ],
                // ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.description),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          size: 16,
                          color: Colors.teal,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          widget.map,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.teal,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

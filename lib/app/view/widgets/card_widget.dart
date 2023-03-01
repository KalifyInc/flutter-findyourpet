import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../repository/pet_repository.dart';

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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.tealAccent,
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                // leading: TextButton.icon(
                //     onPressed: () {},
                //     icon: Icon(Icons.abc),
                //     label: Text('teste')),
                leading: Image.network(widget.imageURL),
                title: Text('${widget.name} - ${widget.status}'),
                subtitle: Text(widget.description),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const SizedBox(width: 8),
                  TextButton.icon(
                    icon: const Icon(Icons.phone),
                    label: Text(widget.telephone),
                    onPressed: () {/* ... */},
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.location_pin),
                    label: Text(widget.map),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

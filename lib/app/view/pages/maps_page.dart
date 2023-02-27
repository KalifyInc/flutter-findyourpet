import 'package:flutter/material.dart';

import '../widgets/map_widget.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.pets_rounded,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              const Text(
                'FindYourPet',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
          width: MediaQuery.of(context).size.width.roundToDouble(),
          height: MediaQuery.of(context).size.height.roundToDouble(),
          child: const MapWidget(),
        )));
    // );
  }
}

import 'package:flutter/material.dart';

import '../components/map_component.dart';

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
          title: const Text(
            'FindYourPet',
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
          width: MediaQuery.of(context).size.width.roundToDouble(),
          height: MediaQuery.of(context).size.height.roundToDouble(),
          child: const MapComponent(),
        )));
    // );
  }
}

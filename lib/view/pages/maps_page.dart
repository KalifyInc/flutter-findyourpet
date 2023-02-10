import 'package:flutter/material.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key, required this.title});
  final String title;

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
        body: Center(child: Text(widget.title)));
  }
}

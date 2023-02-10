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
    return Scaffold(body: Center(child: Text(widget.title)));
  }
}

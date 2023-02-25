import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
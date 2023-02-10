import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.title});
  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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

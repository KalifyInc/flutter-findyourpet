import 'package:flutter/material.dart';

class SubTitle extends StatefulWidget {
  const SubTitle({super.key, required this.title});
  final String title;

  @override
  State<SubTitle> createState() => _SubTitleState();
}

class _SubTitleState extends State<SubTitle> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:FindYourPet/app/view/widgets/form_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: const [
                    Text(
                      'CADASTRAR PETS',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 16),
                    FormWidget(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

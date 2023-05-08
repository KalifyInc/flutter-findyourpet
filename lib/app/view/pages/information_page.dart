import 'package:FindYourPet/app/controller/information_controller.dart';
import 'package:flutter/material.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final currentYear = DateTime.now().year;
  final informationController = InformationController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/logo-transp.png'),
                    const Text(
                      'Versão 1.0.3',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () => informationController.openTermos(),
                            child: const Text(
                              'Termos',
                              style: TextStyle(fontSize: 14),
                            )),
                        const Text('-'),
                        TextButton(
                            onPressed: () => informationController
                                .openPoliticasDePrivacidade(),
                            child: const Text(
                              'Politicas de Privacidade',
                              style: TextStyle(fontSize: 14),
                            ))
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '2022 - $currentYear Kalify Inc.',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

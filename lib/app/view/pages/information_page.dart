import 'package:flutter/material.dart';

import '../../controller/link_controller.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final currentYear = DateTime.now().year;
  final controller = LinkController();
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
                      'Versão 1.1.0',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () => controller.openLink(
                                context: context,
                                urlParam:
                                    'https://findyourpet.vercel.app/termos/'),
                            child: const Text(
                              'Termos',
                              style: TextStyle(fontSize: 14),
                            )),
                        const Text('-'),
                        TextButton(
                            onPressed: () => controller.openLink(
                                context: context,
                                urlParam:
                                    'https://findyourpet.vercel.app/politicas-de-privacidade/'),
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

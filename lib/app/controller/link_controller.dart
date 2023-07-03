import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkController {
  openLink({required BuildContext context, required String urlParam}) async {
    Uri url = Uri.parse(urlParam);
    try {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Erro: ${e.toString()}',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }
}

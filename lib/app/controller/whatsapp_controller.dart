import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsAppController {
  openWhatsapp(
      {required BuildContext context, required String telephoneNumber}) async {
    final Uri whatsappURL = Uri.parse(
        "https://api.whatsapp.com/send?phone=$telephoneNumber&text=Olá%2C+tudo+bom%3F+Vim+do+FindYourPet+e+estou+interessada+em+saber+mais+a+respeito+do+pet+que+está+no+anúncio+..");
    if (await canLaunchUrl(whatsappURL)) {
      await launchUrl(whatsappURL, mode: LaunchMode.externalApplication);
    } else {
      throw 'Error';
    }
  }
}

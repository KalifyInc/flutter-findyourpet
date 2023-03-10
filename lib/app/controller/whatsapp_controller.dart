import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

class WhatsAppController extends GetxController {
  static WhatsAppController get instance => Get.find();

  openWhatsapp(
      {required BuildContext context, required String telephoneNumber}) async {
    final Uri whatsappURL =
        Uri.parse("https://api.whatsapp.com/send?phone=$telephoneNumber");

    if (await canLaunchUrl(whatsappURL)) {
      await launchUrl(whatsappURL, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar('Erro!', 'Tente novamente mais tarde!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    }
  }
}

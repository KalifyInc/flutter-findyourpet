// import 'dart:io' show Platform;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

class WhatsAppController extends GetxController {
  static WhatsAppController get instance => Get.find();

  openWhatsapp(
      {required BuildContext context, required String telephoneNumber}) async {
    // await FlutterLaunch.launchWhatsapp(phone: '558592923081', message: 'Teste')
    //     .whenComplete(() => Get.snackbar('Carregou', 'Deu certo?',
    //         snackPosition: SnackPosition.BOTTOM,
    //         backgroundColor: Colors.blueAccent,
    //         colorText: Colors.white))
    //     .onError((error, stackTrace) => Get.snackbar('Error', error.toString(),
    //         snackPosition: SnackPosition.BOTTOM,
    //         backgroundColor: Colors.redAccent,
    //         colorText: Colors.white));
    final whatsappURlAndroid = Uri.parse(
        "https://api.whatsapp.com/send?phone=$telephoneNumber&text=&source=&data=&app_absent=");
    String whatsappURLIos = "https://wa.me/$telephoneNumber";
    if (Platform.isIOS) {
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(whatsappURLIos));
      } else {
        Get.snackbar('Error', 'Whatsapp não instalado!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white);
      }
    } else {
      if (await canLaunchUrl(whatsappURlAndroid)) {
        await canLaunchUrl(whatsappURlAndroid);
        // await launchUrl(whatsappURlAndroid);
      } else {
        Get.snackbar('Error Android!', 'Whatsapp não instalado!',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white);
      }
    }
  }
}

import 'package:url_launcher/url_launcher.dart';

class InformationController {
  openTermos() async {
    Uri url = Uri.parse('https://findyourpet.vercel.app/termos');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Error';
    }
  }

  openPoliticasDePrivacidade() async {
    Uri url =
        Uri.parse('https://findyourpet.vercel.app/politicas-de-privacidade');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Error';
    }
  }
}

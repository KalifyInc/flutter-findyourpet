import 'package:FindYourPet/app/view/pages/start_page.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'assets/images/logo-transp.png',
        width: 512,
        height: 512,
      ),
      backgroundColor: Colors.grey.shade100,
      showLoader: true,
      loaderColor: Colors.teal,
      navigator: const StartPage(),
      durationInSeconds: 5,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:FindYourPet/app/view/pages/information_page.dart';
import 'package:FindYourPet/app/view/pages/maps_page.dart';
import 'package:FindYourPet/app/view/pages/register_page.dart';

import '../components/bottom_navigation_bar.dart';
import 'home_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int currentIndex = 0;

  List<Widget> bodyWidget = const [
    HomePage(title: 'Home Page'),
    RegisterPage(),
    MapsPage(),
    InformationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyWidget[currentIndex],
      bottomNavigationBar: BottomNavigation(
          currentIndex: currentIndex,
          onTapController: (newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          }),
    );
  }
}

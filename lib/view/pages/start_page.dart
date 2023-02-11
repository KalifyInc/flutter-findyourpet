import 'package:flutter/material.dart';
import 'package:mobile_find_your_pet/view/pages/information_page.dart';
import 'package:mobile_find_your_pet/view/pages/maps_page.dart';
import 'package:mobile_find_your_pet/view/pages/register_page.dart';

import '../components/bottom_navigation_bar.dart';
import 'home_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int currentPage = 0;
  late PageController pageController;

  setCurrentPage(page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: setCurrentPage,
        children: const [
          HomePage(title: 'Home Page'),
          RegisterPage(title: 'Register Page'),
          MapsPage(title: 'Maps Page'),
          InformationPage(title: 'Information Page'),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
          currentIndex: currentPage,
          onTapController: (page) {
            pageController.animateToPage(page,
                duration: const Duration(milliseconds: 400),
                curve: Curves.ease);
          }),
    );
  }
}

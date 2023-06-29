import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/information_page.dart';
import '../pages/maps_page.dart';
import '../pages/register_page.dart';

class TabNavigationItem {
  final Widget page;
  final Widget? title;
  final Icon icon;

  TabNavigationItem({required this.page, this.title, required this.icon});

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: const HomePage(),
          icon: const Icon(Icons.pets),
        ),
        TabNavigationItem(
          page: const RegisterPage(),
          icon: const Icon(Icons.app_registration),
        ),
        // TabNavigationItem(
        //   page: const MapsPage(),
        //   icon: const Icon(Icons.location_pin),
        // ),
        TabNavigationItem(
          page: const InformationPage(),
          icon: const Icon(Icons.info_outline),
        ),
      ];
}

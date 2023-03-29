import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/register_page.dart';
import '../pages/maps_page.dart';

import '../pages/information_page.dart';

class TabNavigatorRoutes {
  static const String home = '/';
  static const String register = '/register';
  static const String maps = '/maps';
  static const String information = '/information';
  static const String error = '/error';
}

class TabNavigator extends StatelessWidget {
  const TabNavigator(
      {super.key, required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState>? navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {
    Widget child;

    switch (tabItem) {
      case 'HomePage':
        child = const HomePage();
        break;

      case 'RegisterPage':
        child = const RegisterPage();
        break;

      case 'MapsPage':
        child = const MapsPage();
        break;

      case 'InformationPage':
        child = const InformationPage();
        break;

      default:
        child = const HomePage();
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}

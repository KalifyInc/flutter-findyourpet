import 'package:flutter/material.dart';

import '../view/widgets/tab_navigator.dart';

class RouteController {
  String currentPage = 'HomePage';
  int currentIndex = 0;

  List<String> pageKeys = const [
    'HomePage',
    'RegisterPage',
    'MapsPage',
    'InformationPage',
  ];

  Map<String, GlobalKey<NavigatorState>> navigatorKeys = {
    'HomePage': GlobalKey<NavigatorState>(),
    'RegisterPage': GlobalKey<NavigatorState>(),
    'MapsPage': GlobalKey<NavigatorState>(),
    'InformationPage': GlobalKey<NavigatorState>(),
    'ErrorPage': GlobalKey<NavigatorState>(),
  };

  Widget buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}

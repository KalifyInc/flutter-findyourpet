import 'package:FindYourPet/app/controller/route_controller.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  RouteController routeController = RouteController();

  void _selectTab(String tabItem, int index) {
    if (tabItem == routeController.currentPage) {
      routeController.navigatorKeys[tabItem]!.currentState!
          .popUntil((route) => route.isFirst);
    } else {
      setState(() {
        routeController.currentPage = routeController.pageKeys[index];
        routeController.currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab = !await routeController
            .navigatorKeys[routeController.currentPage]!.currentState!
            .maybePop();
        if (isFirstRouteInCurrentTab) {
          if (routeController.currentPage != 'HomePage') {
            _selectTab('HomePage', 1);

            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          routeController.buildOffstageNavigator('HomePage'),
          routeController.buildOffstageNavigator('RegisterPage'),
          routeController.buildOffstageNavigator('MapsPage'),
          routeController.buildOffstageNavigator('InformationPage'),
          routeController.buildOffstageNavigator('ErrorPage'),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: routeController.currentIndex,
          onTap: (int index) {
            // setState(() {
            //   currentIndex = newIndex;
            // });
            _selectTab(routeController.pageKeys[index], index);
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 30,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.pets), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.app_registration), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.location_pin), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.info_outline), label: ''),
          ],
        ),
      ),
    );
  }
}

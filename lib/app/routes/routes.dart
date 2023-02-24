import '../view/pages/home_page.dart';
import '../view/pages/information_page.dart';
import '../view/pages/maps_page.dart';
import '../view/pages/register_page.dart';

final routes = {
  '/': (context) => const HomePage(title: 'Home Page'),
  '/register': (context) => const RegisterPage(),
  '/maps': (context) => const MapsPage(),
  '/information': (context) => const InformationPage(),
};

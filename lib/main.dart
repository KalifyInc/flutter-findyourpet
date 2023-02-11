import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_find_your_pet/themes/app_theme.dart';
import '../config/firebase_options.dart';
import 'view/pages/start_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Find your pet',
        debugShowCheckedModeBanner: true,
        theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Poppins'),
        darkTheme: AppTheme().darkTheme, // standard dark theme
        themeMode: ThemeMode.system, // device controls theme),
        home: const StartPage());
  }
}

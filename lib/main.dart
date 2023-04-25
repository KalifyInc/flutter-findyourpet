import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:FindYourPet/app/themes/app_theme.dart';
import 'app/config/firebase_options.dart';
import 'app/view/pages/error_page.dart';
import 'app/view/pages/intro_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  final Future<FirebaseApp> _inicializacao = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: AppTheme.themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            title: 'FindYourPet',
            debugShowCheckedModeBanner: false,
            theme: AppTheme().lightTheme,
            darkTheme: AppTheme().darkTheme, // standard dark theme
            themeMode: currentMode,
            home: FutureBuilder(
              future: _inicializacao,
              builder: (context, app) {
                if (app.connectionState == ConnectionState.done) {
                  return const IntroPage();
                }

                if (app.hasError) {
                  return const ErrorPage();
                }

                return const IntroPage();
              },
            ),
          );
        });
  }
}

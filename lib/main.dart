import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:FindYourPet/app/themes/app_theme.dart';
import 'app/config/firebase_options.dart';
import 'app/view/pages/error_page.dart';
import 'app/view/pages/loading_page.dart';
import 'app/view/pages/start_page.dart';

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
    return MaterialApp(
      title: 'Find your pet',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Poppins'),
      darkTheme: AppTheme().darkTheme, // standard dark theme
      themeMode: ThemeMode.system, // device controls theme),
      home: FutureBuilder(
        future: _inicializacao,
        builder: (context, app) {
          if (app.connectionState == ConnectionState.done) {
            return const StartPage();
          }

          if (app.hasError) return const ErrorPage();

          return const LoadingPage();
        },
      ),
    );
  }
}

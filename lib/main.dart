import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../assets/firebase_options.dart';
import 'view/pages/start_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Find your pet',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: StartPage());
  }
}

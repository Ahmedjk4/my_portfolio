import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/firebase_options.dart';
import 'package:my_portfolio/pages/home_page.dart';
import 'package:my_portfolio/styles/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Portfoilo());
}

class Portfoilo extends StatelessWidget {
  const Portfoilo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ahmed Elessawy',
      theme: kCustomTheme,
      home: const HomePage(),
    );
  }
}

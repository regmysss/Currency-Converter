import 'package:currencyconverter/pages/Profile.dart';
import 'package:currencyconverter/pages/home.dart';
import 'package:currencyconverter/pages/settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/main',
      routes: {
        '/main': (context) => const Home(),
        '/profile': (context) => const Profile(),
        '/settings': (context) => const Settings(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'UI/Screen/register.dart';
import 'UI/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'drakojam',
      theme: classicThemeDark,
      home: const RegistScreen(),
    );
  }
}

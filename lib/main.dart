import 'package:flutter/material.dart';
import 'package:quizitto/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent,brightness: Brightness.dark),
        useMaterial3: true
      ),
      home: IntroPage(),
    );
  }
}


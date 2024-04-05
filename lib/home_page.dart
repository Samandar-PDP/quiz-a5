import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.nickname});
  final String nickname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(nickname, style: const TextStyle(fontSize: 50),),
    );
  }
}

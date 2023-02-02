import 'package:custom_designs/src/screens/animations_screen.dart';
import 'package:custom_designs/src/screens/headers_screen.dart';
import 'package:custom_designs/src/screens/square_animated_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Custom designs',
      debugShowCheckedModeBanner: false,
      home: SquareAnimatedScreen()
    );
  }
}
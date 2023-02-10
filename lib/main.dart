import 'package:custom_designs/src/screens/sliver_list_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Custom designs',
      debugShowCheckedModeBanner: false,
      home: SliverListScreen()
    );
  }
}
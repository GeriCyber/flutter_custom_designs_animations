import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/headers.dart';

class HeadersScreen extends StatelessWidget {
  const HeadersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GradientHeader()
    );
  }
}
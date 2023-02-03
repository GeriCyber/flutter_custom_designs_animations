import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressScreen extends StatefulWidget {
  const CircularProgressScreen({super.key});

  @override
  State<CircularProgressScreen> createState() => _CircularProgressScreenState();
}

class _CircularProgressScreenState extends State<CircularProgressScreen> 
with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double percentage = 0.0;
  double newPercentage = 0.0;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800)
    );

    controller.addListener(() {
      setState(() {
        percentage = lerpDouble(percentage, newPercentage, controller.value)!; 
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed:() {
          percentage = newPercentage;
          newPercentage += 10;
          if(newPercentage > 100) {
            percentage = 0;
            newPercentage = 0;
          }
          controller.forward(from: 0.0);
          setState(() { });
        },
        child: const Icon(Icons.refresh),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: _RadialProgress(percentage),
          ),
        ),
      ),
    );
  }
}

class _RadialProgress extends CustomPainter {
  final percentage;

  _RadialProgress(this.percentage);
  
  @override 
  void paint(Canvas canvas, Size size) {
    
    // circle 
    final paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

      final center = Offset(size.width * 0.5, size.height / 2);
      final ratio = min(size.width * 0.5, size.height * 0.5);
      
      canvas.drawCircle(center, ratio, paint);

      // arc
      final paintArc = Paint()
        .. strokeWidth = 10
        ..color = Colors.pink
        ..style = PaintingStyle.stroke;

        double arcAngle = 2 * pi * (percentage / 100);
        canvas.drawArc(
          Rect.fromCircle(center: center, radius: ratio),
          -pi /2,
          arcAngle,
          false,
          paintArc
        );
  }

  @override 
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
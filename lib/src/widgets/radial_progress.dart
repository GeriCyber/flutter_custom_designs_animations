import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final percentage;
  final Color color;
  final Color indicatorColor;
  final double arcStrokeWidth;
  final double strokeWidth;
  
  const RadialProgress({
    super.key, 
    @required this.percentage, 
    this.color = Colors.cyan,
    this.indicatorColor = Colors.grey,
    this.arcStrokeWidth = 4,
    this.strokeWidth = 4
  });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> 
with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late double previousPercentage;

  @override
  void initState() {
    previousPercentage = widget.percentage;
    controller = AnimationController(
      vsync: this, 
      duration: const Duration(milliseconds: 200)
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final differenceAnimation = widget.percentage - previousPercentage;
    previousPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: controller, 
      builder: ((context, child) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _RadialProgress((
              widget.percentage - differenceAnimation) + (differenceAnimation * controller.value),
              widget.color, widget.indicatorColor, widget.arcStrokeWidth, widget.strokeWidth
            ),
          ),
        );
      })
    );
  }
}

class _RadialProgress extends CustomPainter {
  final percentage;
  final Color color;
  final Color indicatorColor;
  final double arcStrokeWidth;
  final double strokeWidth;

  _RadialProgress(
    this.percentage,
    this.color,
    this.indicatorColor,
    this.arcStrokeWidth,
    this.strokeWidth
  );
  
  @override 
  void paint(Canvas canvas, Size size) {

    final Rect rect = Rect.fromCircle(
      center: const Offset(0 ,0), radius: 180
    );

    const gradient = LinearGradient(
      colors: [
        Color(0xffC012FF),
        Color(0xff6D05E8),
        Colors.red
      ]
    );
    
    // circle 
    final paint = Paint()
      ..strokeWidth = strokeWidth
      ..color = indicatorColor
      ..style = PaintingStyle.stroke;

      final center = Offset(size.width * 0.5, size.height / 2);
      final ratio = min(size.width * 0.5, size.height * 0.5);
      
      canvas.drawCircle(center, ratio, paint);

    // arc
    final paintArc = Paint()
      .. strokeWidth = arcStrokeWidth
      // ..color = color
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round
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
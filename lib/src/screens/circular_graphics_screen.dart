import 'package:custom_designs/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class CircularGraphicsScreen extends StatefulWidget {
  const CircularGraphicsScreen({super.key});

  @override
  State<CircularGraphicsScreen> createState() => _CircularGraphicsScreenState();
}

class _CircularGraphicsScreenState extends State<CircularGraphicsScreen> {
  double percentage = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          setState(() {
            percentage += 10;
            if(percentage > 100) {
              percentage = 0;
            }
          });
        },
        child: const Icon(Icons.refresh),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(percentage: percentage, color: Colors.cyan),
              CustomRadialProgress(percentage: percentage, color: Colors.pink),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(percentage: percentage, color: Colors.deepPurple),
              CustomRadialProgress(percentage: percentage, color: Colors.green.shade300),
            ],
          ),
        ],
      )
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  const CustomRadialProgress({
    required this.percentage,
    required this.color
  });

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 200,
      height: 200,
      child: RadialProgress(
        percentage: percentage, 
        color: color,
        indicatorColor: Colors.grey,
        strokeWidth: 8,
        arcStrokeWidth: 10,
      ),
    );
  }
}
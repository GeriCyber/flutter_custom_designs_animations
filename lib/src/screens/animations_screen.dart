import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationsScreen extends StatelessWidget {
  const AnimationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AnimatedSquare(),
      ),
    );
  }
}

class AnimatedSquare extends StatefulWidget {
  const AnimatedSquare({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare> 
with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> opacity;
  late Animation<double> opacityOut;
  late Animation<double> moveRight;
  late Animation<double> enlarge;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 4000)
    );
    rotation = Tween(begin: 0.0, end: 2 * Math.pi).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0, 0.25, curve: Curves.easeOut))
    );

    opacity = Tween(begin: 0.1, end: 1.0).animate(controller);

    moveRight = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );

    enlarge = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );

    opacityOut = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.75, 1.0, curve: Curves.easeOut))
    );

    controller.addListener(() {
      if(controller.status == AnimationStatus.completed) {
        // controller.repeat();
        // controller.reverse();
        controller.reset();
      } 
      // if(controller.status == AnimationStatus.dismissed) {
      //   controller.forward();
      // }
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
    //play
    controller.forward();
    // controller.repeat();

    return AnimatedBuilder(
      animation: controller, 
      child: const _Rectangle(),
      builder: (context, childRectangle) {
        return Transform.translate(
          offset: Offset(moveRight.value, 0),
          child: Transform.rotate(
            angle: rotation.value,
            child: Opacity(
              opacity: (opacity.value != 1) ? opacity.value : opacityOut.value,
              child: Transform.scale(
                scale: enlarge.value,
                child: childRectangle
              ),
            )
          ),
        );
      }
    );
  }
}

class _Rectangle extends StatelessWidget {
  const _Rectangle();

  @override 
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.deepPurple
      ),
    );
  }
}
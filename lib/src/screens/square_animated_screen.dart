import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SquareAnimatedScreen extends StatelessWidget {
  const SquareAnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _SquareAnimated()
      ),
    );
  }
}

class _SquareAnimated extends StatefulWidget {
  const _SquareAnimated({
    Key? key,
  }) : super(key: key);

  @override
  State<_SquareAnimated> createState() => _SquareAnimatedState();
}

class _SquareAnimatedState extends State<_SquareAnimated> 
with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> moveRight;
  late Animation<double> moveUp;
  late Animation<double> moveLeft;
  late Animation<double> moveDown;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this, 
      duration: const Duration(milliseconds: 4500)
    );

    moveRight = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller, 
        curve: const Interval(0, 0.25, curve: Curves.bounceOut)
      )
    );

    moveUp = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(
        parent: controller, 
        curve: const Interval(0.25, 0.5, curve: Curves.bounceOut)
      )
    );

    moveLeft = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(
        parent: controller, 
        curve: const Interval(0.5, 0.75, curve: Curves.bounceOut)
      )
    );

    moveDown = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller, 
        curve: const Interval(0.75, 1.0, curve: Curves.bounceOut)
      )
    );

    controller.addListener(() {
      if(controller.status == AnimationStatus.completed) {
        controller.reset();
      } 
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();

    return AnimatedBuilder(
      animation: controller, 
      child: _Rectangle(),
      builder: ((context, child) {
        return Transform.translate(
          offset: Offset(moveRight.value + moveLeft.value, moveUp.value + moveDown.value),
          child: child,
        );
      })
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
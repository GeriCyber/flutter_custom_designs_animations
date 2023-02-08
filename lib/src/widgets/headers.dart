import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SquareHeader extends StatelessWidget {
  const SquareHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615AAB),
    );
  }
}

class CircularHeader extends StatelessWidget {
  const CircularHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60)
        )
      ),
    );
  }
}

class DiagonalHeader extends StatelessWidget {
  const DiagonalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _DiagonalHeaderPainter(),
      ),
    );
  }
}

class TriangleHeader extends StatelessWidget {
  const TriangleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _TriangleHeaderPainter(),
      ),
    );
  }
}

class PeakHeader extends StatelessWidget {
  const PeakHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _PeakHeaderPainter(),
      ),
    );
  }
}

class CurveHeader extends StatelessWidget {
  const CurveHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _CurveHeaderPainter(),
      ),
    );
  }
}

class WavesHeader extends StatelessWidget {
  const WavesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _WavesHeaderPainter(),
      ),
    );
  }
}

class GradientHeader extends StatelessWidget {
  const GradientHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _GradientHeaderPainter(),
      ),
    );
  }
}

class _DiagonalHeaderPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    final path = Path();

    pencil.color = const Color(0xff615AAB);
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 20;

    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _TriangleHeaderPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    final path = Path();

    pencil.color = const Color(0xff615AAB);
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 20;

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _PeakHeaderPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    final path = Path();

    pencil.color = const Color(0xff615AAB);
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 20;

    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.32);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _CurveHeaderPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    final path = Path();

    pencil.color = const Color(0xff615AAB);
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 20;

    path.lineTo(0, size.height * 0.20);

    // curve method
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.40, size.width, size.height * 0.20);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _WavesHeaderPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    final path = Path();

    pencil.color = const Color(0xff615AAB);
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 20;

    path.lineTo(0, size.height * 0.25);

    // curve method
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _GradientHeaderPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(
      center: const Offset(0.0, 55.0),
      radius: 180
    );
    const Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color> [
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA)
      ],
      stops: [
        0.2, 0.5, 1.0
      ]
    );
    final pencil = Paint()..shader = gradient.createShader(rect);
    final path = Path();

    pencil.color = const Color(0xff615AAB);
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 20;

    path.lineTo(0, size.height * 0.25);

    // curve method
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class DashboardHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color primaryColor;
  final Color secondaryColor;

  const DashboardHeader({
    super.key, 
    this.primaryColor = Colors.cyan,
    this.secondaryColor = Colors.lightGreen,
    required this.icon, 
    required this.title, 
    required this.subtitle, 
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _HeaderBackground(
          primaryColor: primaryColor, 
          secondaryColor: secondaryColor
        ),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            icon, 
            size: 270, 
            color: Colors.white.withOpacity(0.2)
          )
        ),
        Column(
          children: [
            const SizedBox(height: 80, width: double.infinity,),
            Text(
              subtitle, 
              style: TextStyle(
                fontSize: 20, 
                color: Colors.white.withOpacity(0.7)
              )
            ),
            const SizedBox(height: 20),
            Text(
              title, 
              style: TextStyle(
                fontSize: 25, 
                color: Colors.white.withOpacity(0.7),
                fontWeight: FontWeight.bold
              )
            ),
            const SizedBox(height: 20),
            FaIcon(
              icon, 
              size: 80, 
              color: Colors.white
            )
          ],
        )
      ],
    );
  }
}

class _HeaderBackground extends StatelessWidget {
  final Color primaryColor;
  final Color secondaryColor;
  
  const _HeaderBackground({
    Key? key, 
    required this.primaryColor, 
    required this.secondaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          colors: <Color>[
            primaryColor,
            secondaryColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
    );
  }
}
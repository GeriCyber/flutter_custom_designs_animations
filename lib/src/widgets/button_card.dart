import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color primaryColor;
  final Color secondaryColor;
  final Function() onPress;

  const ButtonCard({
    super.key, 
    this.icon = FontAwesomeIcons.accessibleIcon, 
    this.primaryColor = Colors.cyan, 
    this.secondaryColor = Colors.lightGreen, 
    required this.text, 
    required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        children: [
          _ButtonBackground(
            icon: icon, 
            primaryColor: primaryColor, 
            secondaryColor: secondaryColor
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 140, width: 40),
              FaIcon(
                icon,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                ),
              ),
              const FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white,
              ),
              const SizedBox(width: 40),
            ],
          )
        ],
      ),
    );
  }
}

class _ButtonBackground extends StatelessWidget {
  final IconData icon;
  final Color primaryColor;
  final Color secondaryColor;
  
  const _ButtonBackground({
    Key? key, 
    required this.icon, 
    required this.primaryColor, 
    required this.secondaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
            BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(4, 6),
            blurRadius: 10
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            primaryColor,
            secondaryColor
          ]
        )
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                icon,
                size: 150,
                color: Colors.white.withOpacity(0.2),
              ),
            )
          ],
        ),
      ),
    );
  }
}
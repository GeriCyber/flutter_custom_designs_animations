import 'package:animate_do/animate_do.dart';
import 'package:custom_designs/src/widgets/button_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/dashboard_items.dart';
import '../widgets/headers.dart';

class CardsDashboardScreen extends StatelessWidget {
  const CardsDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> itemsMap = items.map(
      (item) => FadeInLeft(
        duration: const Duration(milliseconds: 250),
        child: ButtonCard(
          icon: item.icon,
          text: item.text,
          primaryColor: item.primaryColor,
          secondaryColor: item.secondaryColor, 
          onPress: () => print(item.text),
        ),
      )
    ).toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 200),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 80),
                ...itemsMap
              ],
            ),
          ),
          const Header()
        ],
      )
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const DashboardHeader(
          icon: FontAwesomeIcons.plus,
          subtitle: 'You have requested',
          title: 'Medical Assistance',
          primaryColor: Color(0xff526BF6),
          secondaryColor: Color(0xff67ACF2),
        ),
        Positioned(
          right: 0,
          top: 45,
          child: RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15.0),
            child: const FaIcon(
              FontAwesomeIcons.ellipsisVertical, 
              color: Colors.white
            ),
          ),
        )
      ],
    );
  }
}
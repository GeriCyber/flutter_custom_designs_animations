import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemButton {
  final IconData icon;
  final String text;
  final Color primaryColor;
  final Color secondaryColor;

  ItemButton(
    this.icon, 
    this.text, 
    this.primaryColor, 
    this.secondaryColor
  );
}

final items = <ItemButton>[
  ItemButton( FontAwesomeIcons.carBurst, 'Car Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
  ItemButton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
  ItemButton( FontAwesomeIcons.masksTheater, 'Theft / Harassment', const Color(0xffF2D572), const Color(0xffE06AA3) ),
  ItemButton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
  ItemButton( FontAwesomeIcons.carBurst, 'Car Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
  ItemButton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
  ItemButton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
  ItemButton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
  ItemButton( FontAwesomeIcons.carBurst, 'Car Accident', const Color(0xff6989F5), const Color(0xff906EF5) ),
  ItemButton( FontAwesomeIcons.plus, 'Medical Emergency', const Color(0xff66A9F2), const Color(0xff536CF6) ),
  ItemButton( FontAwesomeIcons.masksTheater, 'Theft / Harrasement', const Color(0xffF2D572), const Color(0xffE06AA3) ),
  ItemButton( FontAwesomeIcons.personBiking, 'Awards', const Color(0xff317183), const Color(0xff46997D) ),
];
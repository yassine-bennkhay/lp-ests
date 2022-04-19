import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

List<GButton> tabs = const [
  GButton(
    icon: Icons.home,
    text: 'Accueil',
  ),
  GButton(
    gap: 12,
    icon: FontAwesomeIcons.graduationCap,
    text: 'Filières LP',
  ),
  GButton(
    icon: Icons.add,
    text: 'S\'inscrire',
  ),
  GButton(
    icon: Icons.person_sharp,
    text: 'Profile',
  ),
];

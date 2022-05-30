import 'package:flutter/material.dart';
import 'package:lp_ests/screens/profile/profile_screen.dart';
import 'package:lp_ests/send_form.dart';

import '../screens/apply/apply.dart';
import '../screens/filiers/filiers.dart';

final List<Widget> pages = [
  const SendForm(),
  // Accueil(),
  const Filiers(),
  const Apply(),
  ProfileScreen(),
];
List<Text> text = [
  const Text(
    'Accueil',
  ),
  const Text(
    'Filières LP',
  ),
  const Text(
    'S\'inscrire',
  ),
  const Text(
    'Profile',
  ),
];

const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);

const kDefaultPaddin = 20.0;

const kPrimaryColor = Color(0xFF06113C);
const kCardColor = Color(0xFFF5F6F9);
const kNavBarBackgroundColor = Color(0xffDDDDDD);

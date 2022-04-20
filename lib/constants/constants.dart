 import 'package:flutter/material.dart';

import '../screens/accueil.dart';
import '../screens/apply.dart';
import '../screens/filiers/filiers.dart';
import '../screens/profile.dart';
final List<Widget> pages = [
    const Accueil(),
    const Filiers(),
    const Apply(),
    const Profle(),
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
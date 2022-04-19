import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: GNav(
          padding: EdgeInsets.all(16),
          tabBackgroundColor: Color(0xffEEEEEE),
          backgroundColor: Color(0xffFAF5E4),
          activeColor: Color(0xffF8B400),
          color: Color(0xff125B50),
          gap: 5,
          tabs: [
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
            )
          ]),
    );
  }
}

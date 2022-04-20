import 'package:flutter/material.dart';

class Accueil extends StatelessWidget {
  const Accueil({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const <Widget>[
          ListTile(
            title: Center(
                child: Text(
              'Organisation Pédagogique des licences professionnelles (LP) :',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Hmedium'),
            )),
            subtitle: Center(
                child: Text(
                    'L’accès à la licence professionnelle se fait directement au semestre 5 pour les titulaires d\'un DUT ou équivalent ayant les prérequis nécessaires. Il s\'agit d\'un cycle de 2 semestres étalé sur une année'
                    'La formation dispensée apporte à la fois des connaissances scientifiques approfondies, un savoir-faire technologique et une bonne compétence en communication et en gestion industrielle.',
                    style: TextStyle(fontFamily: 'Hregular'))),
          ),
          // ignore: deprecated_member_use
          Text(
            'Filières LP de l\'EST-Safi :',
            style: TextStyle(color: Colors.black, fontFamily: 'Hmedium'),
          ),

          ListTile(
            title: Text('Les LP se sont mises en équipe :',
                style: TextStyle(fontFamily: 'Hmedium')),
            subtitle: Text(
                'Pour éviter aux étudiants les candidatures multiples et les ressources d’information inaccessibles, l’ESTS propose aux candidats des LP ESTS un « Guichet Unique » de candidature, d’information et de communication à travers cette application',
                style: TextStyle(fontFamily: 'Hregular', letterSpacing: 0)),
          ),
        ],
      ),
    );
  }
}

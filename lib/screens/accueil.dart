import 'package:flutter/material.dart';
import 'package:lp_ests/constants/constants.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  late bool isLoading;
  @override
  void initState() {
    isLoading = true;
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
            color: kPrimaryColor,
          ))
        : SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Container(
                    decoration: BoxDecoration(
                      color: kHomeCardColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Organisation Pédagogique des licences professionnelles (LP)',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Hmedium'),
                        ),
                      ),
                    ),
                  ),
                  subtitle: Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: kHomeCardColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                              'L’accès à la licence professionnelle se fait directement au semestre 5 pour les titulaires d\'un DUT ou équivalent ayant les prérequis nécessaires. Il s\'agit d\'un cycle de 2 semestres étalé sur une année'
                              'La formation dispensée apporte à la fois des connaissances scientifiques approfondies, un savoir-faire technologique et une bonne compétence en communication et en gestion industrielle.',
                              style: TextStyle(
                                  fontFamily: 'Hregular',
                                  color: Colors.white))),
                    ),
                  ),
                ),
                // ignore: deprecated_member_use
                // const Text(
                //   'Filières LP de l\'EST-Safi :',
                //   style: TextStyle(color: Colors.black, fontFamily: 'Hmedium'),
                // ),

                ListTile(
                  title: Container(
                    decoration: BoxDecoration(
                      color: kHomeCardColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Filières LP de l\'EST-Safi',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Hmedium'),
                        ),
                      ),
                    ),
                  ),
                  //Text('Les LP se sont mises en équipe :',
                  //     style: TextStyle(fontFamily: 'Hmedium')),
                  subtitle: Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: kHomeCardColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                              'Pour éviter aux étudiants les candidatures multiples et les ressources d’information inaccessibles, l’ESTS propose aux candidats des LP ESTS un « Guichet Unique » de candidature, d’information et de communication à travers cette application',
                              style: TextStyle(
                                  fontFamily: 'Hregular',
                                  color: Colors.white))),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}

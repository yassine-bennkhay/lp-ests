import 'package:flutter/material.dart';
import 'package:lp_ests/constants/constants.dart';
import 'package:lp_ests/constants/error.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  var datesImportant = [];
  Future getDates() async {
    final response =
        await http.get(Uri.parse(baseUrl+'/AnneeUiversitaire'));
    if (response.statusCode == 200) {
      var deadlinesDate = jsonDecode(response.body);
      setState(() {
        datesImportant = deadlinesDate;
      });
     // print(datesImportant[0]['DebutCandidatures'].substring(0, 10));
    } else {
      throw Exception('Failed to fetch dates');
    }
  }

  @override
  Widget build(BuildContext context) {
   getDates();
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
            color: kPrimaryColor,
          ))
        : datesImportant.isEmpty
            ? Error()
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
                    cardWidget(
                      name: 'Début de candidature',
                      value: datesImportant[0]['DebutCandidatures'],
                    ),
                    cardWidget(
                      name: 'Fin de candidature',
                      value: datesImportant[0]['FinCandidatures'],
                    ),
                    cardWidget(
                      name: 'Début de présélection',
                      value: datesImportant[0]['DebutPreselection'],
                    ),
                    cardWidget(
                      name: 'Fin de présélection',
                      value: datesImportant[0]['FinPreselection'],
                    ),
                    cardWidget(
                      name: 'La liste principale',
                      value: datesImportant[0]['InscriptionsListP'],
                    ),
                    cardWidget(
                      name: 'La liste d\'attenets',
                      value: datesImportant[0]['InscriptionsListAtt'],
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 12.0, left: 12),
                    //   child: Card(
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(8.0),
                    //     ),
                    //     color: kHomeCardColor,
                    //     child: ListTile(
                    //       contentPadding: const EdgeInsets.all(8.0),
                    //       title: Text(
                    //         datesImportant[0]['DebutCandidatures'],
                    //         style: const TextStyle(color: Colors.white),
                    //       ),
                    //       trailing: Text(
                    //         datesImportant[0]['DebutCandidatures'].substring(0, 10),
                    //         style: const TextStyle(color: Colors.white),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              );
  }
}

class cardWidget extends StatelessWidget {
  cardWidget({
    Key? key,
    required this.name,
    required this.value,
  }) : super(key: key);

  String name;
  String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0, left: 12),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: kHomeCardColor,
        child: ListTile(
          contentPadding: const EdgeInsets.all(8.0),
          title: Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
          trailing: Text(
            value.substring(0, 10),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

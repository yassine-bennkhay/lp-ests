import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SendForm extends StatelessWidget {
  const SendForm({Key? key}) : super(key: key);
  _sendForm() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://192.168.0.123:4000/candidatData'));
    request.body = json.encode({
      "user": 122,
      "personelinfos": {
        "nomFr": "Bennkhay",
        "prenomFr": "yassine",
        "nomAr": "test",
        "prenomAr": "value",
        "email": "test@test.com",
        "phone": "0628519259",
        "cin": "valuevaluevalue",
        "LieuDeNaissance": "value",
        "datenaiss": "0001-11-11",
        "cne": "k1232312"
      },
      "address": "value, value, value",
      "education": {
        "bac": {"id": 1, "Intitule": "BAC SCIENCES AGRONOMIQUES"},
        "notebac": 14,
        "anneebac": 2015,
        "diplome": {
          "id": 2,
          "abreviation": "DUT",
          "Intitule": "Diplôme Universitaire de Technologie"
        },
        "annediplo": 2016,
        "notediplo": 14,
        "filC": {
          "id": 1,
          "Intitule": "Administrateur de systèmes et Réseaux",
          "type_diplome": 2
        },
        "etablissement": {
          "id": 1,
          "Nom": "école supérieure de technologie",
          "abreviation": "EST",
          " ville": "Safi"
        }
      },
      "choices": {
        "filterN1": {
          "id": 4,
          "Intitule": "Métiers de l’Informatique",
          "capaciteMax": 40,
          "coordonnateur": 1,
          "Id_Departement": 1
        },
        "filterN2": {
          "id": 3,
          "Intitule": "Gestion Comptable et Financière",
          "capaciteMax": 30,
          "coordonnateur": 4,
          "Id_Departement": 1
        }
      }
    });
    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
          child: ElevatedButton(
        child: const Text("Envoyer"),
        onPressed: () {
          _sendForm();
        },
      )),
    ));
  }
}

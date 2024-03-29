import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:lp_ests/constants/constants.dart';
import 'package:lp_ests/screens/apply/data.dart';
import 'package:lp_ests/screens/profile/candidature_info/candidat_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/form_response.dart';

class Apply extends StatefulWidget {
  const Apply({Key? key}) : super(key: key);

  @override
  _ApplyState createState() => _ApplyState();
}

class _ApplyState extends State<Apply> {
  var formKey = GlobalKey<FormState>();
  static Data input = Data();
  TextEditingController dateinput = TextEditingController();
  List bacs = [];
  List diplomes = [];
  List filiers = [];
  List filiersToApplyFor = [];
  List etablissements = [];
  List userId = [];
  var _selectedBac;
  String? mapString;
  var _selectedDiplome;
  var _selectedFiliere;
  var _selectedChoiceOne;
  var _selectedChoiceTwo;
  var _selectedEtablissement;
  Future fetchAllBacs() async {
    final response = await http.get(Uri.parse(baseUrl+'/bacs'));
    if (response.statusCode == 200) {
      var jsonUserData = jsonDecode(response.body);
      setState(() {
        bacs = jsonUserData;
      });
    } else {
      throw Exception('Failed to fetch user number of candidat');
    }
  }

  Future fetchAllDiplomes() async {
    final response =
        await http.get(Uri.parse(baseUrl+'/diplomes'));
    if (response.statusCode == 200) {
      var diplomesData = jsonDecode(response.body);
      setState(() {
        diplomes = diplomesData;
      });
    } else {
      throw Exception('Failed to fetch diplomes');
    }
  }

  Future fetchFilierById(var idDiplome) async {
    final response =
        await http.get(Uri.parse(baseUrl+'/filsC/$idDiplome'));
    if (response.statusCode == 200) {
      var diplomesData = jsonDecode(response.body);
      setState(() {
        filiers = diplomesData;
      });
      // print(diplomesData);
    } else {
      throw Exception('Failed to fetch filiers');
    }
  }

  Future fetchFilierToApplyForById(var idFilier) async {
    final response = await http
        .get(Uri.parse(baseUrl+'/filspourpostuler/$idFilier'));
    if (response.statusCode == 200) {
      var filierData = jsonDecode(response.body);
      setState(() {
        filiersToApplyFor = filierData;
      });
    } else {
      throw Exception("Failed to fetch Filiers to apply for.");
    }
  }

  Future fetchEtablissementByDiplomeId(idDiplome) async {
    final response = await http
        .get(Uri.parse(baseUrl+'/etablissement/$idDiplome'));
    if (response.statusCode == 200) {
      var etablissementData = jsonDecode(response.body);
      setState(() {
        etablissements = etablissementData;
      });
    } else {
      throw Exception("Failed to fetch Etablissement");
    }
  }

  void showSnackBarAndNavigate() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Color(0xff06113C),
      content: Text("vous avez bien soumis vos informations"),
      duration: Duration(seconds: 8),
    ));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const CandidatData()));
  }

  Future getNumberOfcandidatures() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userIdf = sharedPreferences.getInt('id');

    final response = await http
        .get(Uri.parse(baseUrl+'/candidatData/$userIdf'));
    if (response.statusCode == 200) {
      var userIdData = jsonDecode(response.body);
      setState(() {
        userId = userIdData;
      });
      print(userId[0]['numberOfcandidatures']);
    } else {
      throw Exception("failed to fetch user id");
    }
  }

  var isLoadingToSendFormData = false;
  _sendForm() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt("id");
    setState(() {
      isLoadingToSendFormData = true;
    });
    print(_selectedDiplome);

    var userInputData = {
      "user": userId,
      "personelinfos": {
        "nomFr": input.inputs[1],
        "prenomFr": input.inputs[0],
        "nomAr": input.inputs[3],
        "prenomAr": input.inputs[2],
        "email": input.inputs[7],
        "phone": input.inputs[8],
        "cin": input.inputs[4],
        "LieuDeNaissance": input.inputs[6],
        "datenaiss": dateinput.text,
        "cne": input.inputs[5]
      },
      "address":
          input.inputs[9] + ", " + input.inputs[10] + ", " + input.inputs[11],
      "education": {
        "bac": {
          "id": "${_selectedBac['id']}",
          "Intitule": "${_selectedBac['Intitule']}"
        },
        "notebac": input.inputs[12],
        "anneebac": input.inputs[13],
        "diplome": {
          "id": _selectedDiplome['id'],
          "abreviation": "${_selectedDiplome['abreviation']}",
          "Intitule": "${_selectedDiplome['Intitule']}",
        },
        "annediplo": input.inputs[14],
        "notediplo": input.inputs[15],
        "filC": {
          "id": _selectedFiliere['id'],
          "Intitule": "${_selectedFiliere['Intitule']}",
          "type_diplome": _selectedFiliere['type_diplome']
        },
        "etablissement": {
          "id": _selectedEtablissement['id'],
          "Nom": "${_selectedEtablissement['Nom']}",
          "abreviation": "${_selectedEtablissement['abreviation']}",
          " ville": "${_selectedEtablissement['ville']}"
        }
      },
      "choices": {
        "filterN1": {
          "id": _selectedChoiceOne['id'],
          "Intitule": "${_selectedChoiceOne['Intitule']}",
          "description": "${_selectedChoiceOne['description']}",
          "capaciteMax": _selectedChoiceOne['capaciteMax'],
          "coordonnateur": _selectedChoiceOne['coordonnateur'],
          "Id_Departement": _selectedChoiceOne['Id_Departement'],
        },
        "filterN2": {
          "id": _selectedChoiceTwo['id'],
          "Intitule": "${_selectedChoiceTwo['Intitule']}",
          "description": "${_selectedChoiceTwo['description']}",
          "capaciteMax": _selectedChoiceTwo['capaciteMax'],
          "coordonnateur": _selectedChoiceTwo['coordonnateur'],
          "Id_Departement": _selectedChoiceTwo['Id_Departement']
        }
      }
    };
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse(baseUrl+'/candidatData'));
    request.body = json.encode(userInputData);
    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      final responseString = await response.stream.bytesToString();
      var parsedData = FormResponse.fromJson(jsonDecode(responseString));

      setState(() {
        isLoadingToSendFormData = false;
        parsedData.isSuccess
            ? showSnackBarAndNavigate()
            : ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Color(0xff06113C),
                  content: Text(
                      "Désolé, une erreur s'est produite, vous ne pouvez pas la traiter pour le moment."),
                  duration: Duration(seconds: 8),
                ),
              );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color(0xff06113C),
          content: Text(
              "Assurez-vous d'avoir une bonne connexion Internet et réessayez!"),
          duration: Duration(seconds: 8),
        ),
      );
    }
  }

  @override
  void initState() {
    dateinput.text = "";
    super.initState();
    fetchAllBacs();
    fetchAllDiplomes();
    getNumberOfcandidatures();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Theme(
          data: ThemeData(primaryColor: Colors.green),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Les informations Personneles:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    createTextField(
                        'Prénom',
                        TextInputType.text,
                        'S\'il vous plaît entrez votre prénom',
                        0,
                        TextDirection.ltr),
                    const SizedBox(
                      height: 8,
                    ),
                    createTextField(
                      'Nom',
                      TextInputType.text,
                      'S\'il vous plaît entrez votre nom',
                      1,
                      TextDirection.ltr,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    createTextField(
                      'الإسم الشخصي',
                      TextInputType.text,
                      'المرجو ادخال اسمك الشخصي',
                      2,
                      TextDirection.rtl,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    createTextField(
                      'الإسم العائلي',
                      TextInputType.text,
                      'المرجو ادخال اسمك العائلي',
                      3,
                      TextDirection.rtl,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    createTextField(
                      'CIN',
                      TextInputType.text,
                      'S\'il vous plaît entrez votre CIN',
                      4,
                      TextDirection.ltr,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    createTextField(
                      'CNE',
                      TextInputType.text,
                      'S\'il vous plaît entrez votre CNE',
                      6,
                      TextDirection.ltr,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    //here we will add date of birth
                    TextField(
                      controller:
                          dateinput, //editing controller of this TextField
                      decoration: InputDecoration(
                          labelStyle: const TextStyle(color: Color(0xff06113C)),
                          labelText: 'Date de Naissance',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xff06113C), width: 2.0),
                            borderRadius: BorderRadius.circular(8.0),
                          )),
                      readOnly:
                          true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: const ColorScheme.light(
                                    primary: Color(0xff06113C),
                                    // header background color
                                    onPrimary:
                                        Colors.white, // header text color
                                    onSurface: Colors.green, // body text color
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      primary: const Color(
                                          0xff06113C), // button text color
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                1990), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          // print(
                          //     pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              intl.DateFormat('yyyy-MM-dd').format(pickedDate);
                          // print(
                          //     formattedDate); //formatted date output using intl package =>  2021-03-16
                          // //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            dateinput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        }
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    createTextField(
                      'Lieu De Naissance',
                      TextInputType.text,
                      'S\'il vous plaît entrez votre lieu de Naissance',
                      5,
                      TextDirection.ltr,
                    ),

                    const SizedBox(
                      height: 8,
                    ),
                    createTextField(
                      'Email',
                      TextInputType.emailAddress,
                      'S\'il vous plaît entrez votre Email',
                      7,
                      TextDirection.ltr,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    createTextField(
                      'Telephone',
                      TextInputType.number,
                      'S\'il vous plaît entrez votre Numero de telephone',
                      8,
                      TextDirection.ltr,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Address Details:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    createTextField(
                      'Ville',
                      TextInputType.text,
                      'S\'il vous plaît entrez votre Ville',
                      9,
                      TextDirection.ltr,
                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    createTextField(
                      'Rue',
                      TextInputType.text,
                      'S\'il vous plaît entrez votre rue',
                      10,
                      TextDirection.ltr,
                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    createTextField(
                      'Code postale',
                      TextInputType.text,
                      'S\'il vous plaît entrez votre code postale',
                      11,
                      TextDirection.ltr,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Les information du bacalaureat:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DropdownButton(
                      hint: const Text("Choisir le type de votre bac"),
                      isExpanded: true,
                      items: bacs.map((item) {
                        return DropdownMenuItem(
                          child: Text(item['Intitule']),
                          value: item,
                        );
                      }).toList(),
                      onChanged: (newVal) {
                        setState(() {
                          _selectedBac = newVal;
                        });
                      },
                      value: _selectedBac,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    createTextField(
                      'Note du Baccalauréat',
                      TextInputType.number,
                      'S\'il vous plaît entrez votre note de bac',
                      12,
                      TextDirection.ltr,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    createTextField(
                      'Année du Baccalauréat',
                      TextInputType.number,
                      'S\'il vous plaît entrez votre Annee de bac',
                      13,
                      TextDirection.ltr,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Les information du diplome bac+2:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DropdownButton(
                      hint: const Text("Choisir le type de diplome"),
                      isExpanded: true,
                      items: diplomes.map((diplomeItem) {
                        return DropdownMenuItem(
                          child: Text(diplomeItem['Intitule']),
                          value: diplomeItem,
                        );
                      }).toList(),
                      onChanged: (newVal) {
                        setState(() {
                          _selectedDiplome = newVal;
                          _selectedFiliere = null;
                          _selectedEtablissement = null;
                          //     print(_selectedFiliere);
                          // print(_selectedDiplome['id']);
                          fetchFilierById(_selectedDiplome['id']);
                          fetchEtablissementByDiplomeId(_selectedDiplome['id']);
                        });
                      },
                      value: _selectedDiplome,
                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    DropdownButton(
                      hint: const Text("Choisir votre filiere"),
                      isExpanded: true,
                      items: filiers.map((item) {
                        return DropdownMenuItem(
                          child: Text(item['Intitule']),
                          value: item,
                        );
                      }).toList(),
                      onChanged: (newVal) {
                        setState(() {
                          _selectedFiliere = newVal;
                          // print(_selectedFiliere['Intitule']);
                          // print(_selectedFiliere['id']);
                          // print(_selectedFiliere['type_diplome']);

                          //It should be selectedFilier
                          //but for now we don't have all filiers yet.
                          //fetchEtablissementByDiplomeId(_selectedDiplome['id']);
                          fetchFilierToApplyForById(_selectedDiplome['id']);
                          // print(_selectedDiplome['id']);
                        });
                      },
                      value: _selectedFiliere,
                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    DropdownButton(
                      hint: const Text("Choisir votre etablissement"),
                      isExpanded: true,
                      items: etablissements.map((item) {
                        return DropdownMenuItem(
                          child: Text(item['Nom']),
                          value: item,
                        );
                      }).toList(),
                      onChanged: (newVal) {
                        setState(() {
                          _selectedEtablissement = newVal;
                          print(_selectedEtablissement);
                          print(_selectedFiliere);
                          print(_selectedDiplome);
                        });
                      },
                      value: _selectedEtablissement,
                    ),
                    createTextField(
                      'Année d\'obtention du diplôme',
                      TextInputType.number,
                      'S\'il vous plaît entrez votre Annee de bac',
                      14,
                      TextDirection.ltr,
                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    createTextField(
                      'Note du diplome universitaire',
                      TextInputType.number,
                      'S\'il vous plaît entrez votre Annee de bac',
                      15,
                      TextDirection.ltr,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Les informations du choix:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    DropdownButton(
                      hint: const Text("Le premiere choix"),
                      isExpanded: true,
                      items: filiersToApplyFor.map((item) {
                        return DropdownMenuItem(
                          child: Text(item['Intitule']),
                          value: item,
                        );
                      }).toList(),
                      onChanged: (newVal) {
                        setState(() {
                          _selectedChoiceOne = newVal;
                          print(_selectedChoiceOne);
                        });
                      },
                      value: _selectedChoiceOne,
                    ),
                    DropdownButton(
                      hint: const Text("la deuxième choix"),
                      isExpanded: true,
                      items: filiersToApplyFor.map((item) {
                        return DropdownMenuItem(
                          child: Text(item['Intitule']),
                          value: item,
                        );
                      }).toList(),
                      onChanged: (newVal) {
                        setState(() {
                          _selectedChoiceTwo = newVal;
                          print(_selectedChoiceTwo);
                        });
                      },
                      value: _selectedChoiceTwo,
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            backgroundColor: Colors.redAccent,
                          ),
                          onPressed: () {
                            formKey.currentState!.reset();

                            setState(() {});
                          },
                          child: const Center(
                            child: Text(
                              "Supprimer tous les champs",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   width: double.infinity,
                        //   child: ElevatedButton(
                        //       style: ElevatedButton.styleFrom(
                        //         primary: Colors.green,
                        //       ),
                        //       onPressed: () {
                        //         if (formKey.currentState!.validate()) {
                        //           formKey.currentState!.save();

                        //           setState(() {});
                        //         }
                        //       },
                        //       child: const Text('Submit')),
                        // ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            backgroundColor: kPrimaryColor,
                          ),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              //
                              if (userId[0]['numberOfcandidatures'] < 1) {
                                _sendForm();
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Attention!"),
                                      content: const Text(
                                          "vous n'avez le droit de postuler que deux fois"),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          child: const Text("OK"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                              setState(() {});
                            }
                          },
                          child: Center(
                            child: isLoadingToSendFormData
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text(
                                    "Envoyer mes informations",
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    // Text('Prenom: ${input.inputs[0]}'),
                    // Text('Nom: ${input.inputs[1]}'),
                    // Text('PrenomAr: ${input.inputs[2]}'),
                    // Text('NomAr: ${input.inputs[3]}'),
                    // Text('CIN: ${input.inputs[4]}'),
                    // Text('CNE: ${input.inputs[5]}'),
                    // Text('date de naissance: ${dateinput.text}'),
                    // Text('Lieu de naissance: ${input.inputs[6]}'),
                    // Text('Email: ${input.inputs[7]}'),
                    // Text('Telephone: ${input.inputs[8]}'),
                    // Text('Ville: ${input.inputs[9]}'),
                    // Text('Rue: ${input.inputs[10]}'),
                    // Text('code postale: ${input.inputs[11]}'),
                    // Text('bac: $_selectedBac'),
                    // Text('note du bac:${input.inputs[12]}'),
                    // Text('annee du bac:${input.inputs[13]}'),
                    // Text('diplome: $_selectedDiplome'),
                    // Text('filiere: $_selectedFiliere'),
                    // Text('annee du diplome:${input.inputs[14]}'),
                    // Text('note du diplome:${input.inputs[15]}'),

                    // Text('Choice one: $_selectedChoiceOne'),
                    // Text('choice two: $_selectedChoiceTwo'),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  createTextField(String labelText, TextInputType textInputType, String message,
          int index, TextDirection textDirection) =>
      Directionality(
        textDirection: textDirection,
        child: TextFormField(
          onSaved: (value) {
            setState(() {
              input.inputs[index] = value!;
            });
          },
          keyboardType: textInputType,
          decoration: InputDecoration(
              labelStyle: const TextStyle(color: kPrimaryColor),
              labelText: labelText,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kPrimaryColor, width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              )),
          validator: (value) {
            if (value!.isEmpty) {
              return message;
            } else {
              return null;
            }
          },
        ),
      );
}

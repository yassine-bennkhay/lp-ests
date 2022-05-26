import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import 'package:http/http.dart' as http;
import 'dart:convert';

class Apply extends StatefulWidget {
  const Apply({Key? key}) : super(key: key);

  @override
  _ApplyState createState() => _ApplyState();
}

class Data {
  List<String> inputs = ['', '', '', '', '', '', '', '', '', '', '', ''];
}

class _ApplyState extends State<Apply> {
  var formKey = GlobalKey<FormState>();
  static Data input = Data();
  TextEditingController dateinput = TextEditingController();
  List bacs = [];
  var _mySelection;
  Future fetchAllBacs() async {
    final response =
        await http.get(Uri.parse('http://192.168.156.2:4000/bacs'));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      setState(() {
        bacs = jsonData;
      });

      return "Sucess";
    } else {
      throw Exception('Failed to fetch bacs');
    }
  }

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
    fetchAllBacs();
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
                      'CNE',
                      TextInputType.text,
                      'S\'il vous plaît entrez votre CNE',
                      6,
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
                          value: item['id'].toString(),
                        );
                      }).toList(),
                      onChanged: (newVal) {
                        setState(() {
                          _mySelection = newVal;
                        });
                      },
                      value: _mySelection,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    createTextField(
                      'Telephone',
                      TextInputType.number,
                      'S\'il vous plaît entrez votre Numero de telephone',
                      12,
                      TextDirection.ltr,
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                            onPressed: () {
                              formKey.currentState!.reset();

                              setState(() {});
                            },
                            child: const Text('Clear')),
                        const SizedBox(
                          width: 16,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();

                                  setState(() {});
                                }
                              },
                              child: const Text('Submit')),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text('Prenom: ${input.inputs[0]}'),
                    Text('Nom: ${input.inputs[1]}'),
                    Text('PrenomAr: ${input.inputs[2]}'),
                    Text('NomAr: ${input.inputs[3]}'),
                    Text('CIN: ${input.inputs[4]}'),
                    Text('CNE: ${input.inputs[5]}'),
                    Text('Email: ${input.inputs[6]}'),
                    Text('Ville: ${input.inputs[7]}'),
                    Text('Telephone: ${input.inputs[8]}'),
                    Text('Rue: ${input.inputs[9]}'),
                    Text('code postale: ${input.inputs[10]}'),
                    Text('date de naissance: ${dateinput.text}'),
                    Text('bac: $_mySelection'),
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
              labelStyle: const TextStyle(color: Color(0xff06113C)),
              labelText: labelText,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xff06113C), width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              )),
          validator: (text) {
            if (text!.isEmpty) {
              return message;
            } else {
              return null;
            }
          },
        ),
      );
}

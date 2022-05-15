import 'package:flutter/material.dart';
import 'package:lp_ests/screens/apply/textfields/custom_text_field.dart';

class Apply extends StatefulWidget {
const Apply({Key? key}) : super(key: key);

  @override
  _ApplyState createState() => _ApplyState();
}

class Data {
  List<String> inputs = ['',''];
}

class _ApplyState extends State<Apply> {
  var formKey = GlobalKey<FormState>();
  static Data input = Data();
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
                    createTextField('label1', TextInputType.datetime, 'msg', 0),
                    createTextField('label2', TextInputType.datetime, 'msg', 1),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                ),
                                onPressed: () {
                                  formKey.currentState!.reset();
                                  //input1 = '';
                                  //input2 = '';
                                  setState(() {});
                                },
                                child: const Text('Clear'))),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
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
                                child: const Text('show'))),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text('Input1: ${input.inputs[0]}'),
                    Text('Input2: ${input.inputs[1]}'),
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
  createTextField(String labelText, TextInputType textInputType, String message, int index) => TextFormField(
      onSaved: (value) {
        setState(() {
          input.inputs[index] = value!;
        });
      },
      keyboardType: textInputType,
      decoration: InputDecoration(
          labelStyle: const TextStyle(
            color: Colors.green,
          ),
          labelText: labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 2.0),
            borderRadius: BorderRadius.circular(8.0),
          )),
      validator: (text) {
        if (text!.isEmpty) {
          return message;
        } else {
          return null;
        }
      },
    );
}
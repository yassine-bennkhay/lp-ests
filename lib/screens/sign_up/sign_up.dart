import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../sign_in/components/text_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController passController = TextEditingController();
  bool _passwordVisible = false;
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  var isLoading = false;
  _register() async {
    setState(() {
      isLoading = true;
    });
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://192.168.0.124:4000/accounts/register'));
    request.body = json.encode({
      "email": emailController.text,
      "password": passController.text,
      "confirmPassword": passController.text
    });

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Color(0xff06113C),
        content: Text(
            "Inscription réussie, veuillez vérifier votre e-mail pour les instructions de vérification"),
        duration: Duration(seconds: 8),
      ));
      setState(() {
        isLoading = false;
      });
      Future.delayed(const Duration(seconds: 8), () {
        Navigator.pop(context);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Sorry something went wrong!'),
        duration: Duration(milliseconds: 300),
      ));
    }
  }

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            shadowColor: Colors.transparent,
            backgroundColor: const Color(0xff06113C),
            leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back))),
        backgroundColor: const Color(0xFFffffff),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 30, right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.1),
                SizedBox(height: height * 0.1),
                TextWidget(
                    text: "Bienvenue!", fontSize: 26, isUnderLine: false),
                TextWidget(
                    text: "merci de créer votre compte.",
                    fontSize: 26,
                    isUnderLine: false),
                SizedBox(height: height * 0.1),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextInput(
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Une adresse email valide est requis';
                            }
                            return null;
                          },
                          textString: 'Email',
                          textController: emailController,
                          obscureText: false),
                      SizedBox(
                        height: height * .05,
                      ),
                      TextInput(
                        iconButton: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xff06113C),
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Un mot de passe est requis';
                          }
                          return null;
                        },
                        textString: "Mot de passe",
                        textController: passController,
                        obscureText: _passwordVisible,
                        // onSelectParam: (String) {},
                      ),
                      SizedBox(
                        height: height * .05,
                      ),
                      TextInput(
                        iconButton: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xff06113C),
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'La confirmation du mot de passe est requis';
                          }
                          return null;
                        },
                        textString: "Confirmer votre mot de passe",
                        textController: passController,
                        obscureText: _passwordVisible,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .05,
                ),
                SizedBox(
                    height: height * .05,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff06113C),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          _register();
                        }
                      },
                      child: isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text("S'inscrire"),
                    )),
              ],
            ),
          ),
        ));
  }
}

class TextInput extends StatefulWidget {
  final String textString;

  TextEditingController textController;
  bool obscureText;
  var validate;
  Widget? iconButton;
  TextInput(
      {Key? key,
      required this.textString,
      required this.textController,
      required this.obscureText,
      required this.validate,
      this.iconButton})
      : super(key: key);

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validate,
      style: const TextStyle(color: Color(0xFF000000)),
      cursorColor: const Color(0xFF9b9b9b),
      controller: widget.textController,
      keyboardType: TextInputType.text,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        suffixIcon: widget.iconButton,
        labelStyle: const TextStyle(color: Color(0xff06113C)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff06113C), width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        labelText: widget.textString,
        hintStyle: const TextStyle(
            color: Color(0xFF9b9b9b),
            fontSize: 15,
            fontWeight: FontWeight.normal),
      ),
    );
  }
}

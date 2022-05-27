import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'components/text_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController passController = TextEditingController();

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
        'POST', Uri.parse('http://192.168.0.122:4000/accounts/register'));
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
                TextWidget(text: "Criez", fontSize: 26, isUnderLine: false),
                TextWidget(
                    text: "votre compte!", fontSize: 26, isUnderLine: false),
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
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Un mot de passe est requis';
                          }
                          return null;
                        },
                        textString: "Password",
                        textController: passController,
                        obscureText: true,
                        // onSelectParam: (String) {},
                      ),
                      SizedBox(
                        height: height * .05,
                      ),
                      TextInput(
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'La confirmation du mot de passe est requis';
                          }
                          return null;
                        },
                        textString: "Confirmer votre Password",
                        textController: passController,
                        obscureText: true,
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
                          : const Text("Sign Up"),
                    )),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     TextWidget(
                //         text: "Sign Up", fontSize: 22, isUnderLine: false),
                //     GestureDetector(
                //         onTap: () {},
                //         child: Container(
                //           height: 80,
                //           width: 80,
                //           decoration: const BoxDecoration(
                //             shape: BoxShape.circle,
                //             color: Color(0xFF363f93),
                //           ),
                //           child: const Icon(Icons.arrow_forward,
                //               color: Colors.white, size: 30),
                //         ))
                //   ],
                // ),
                SizedBox(height: height * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(context,
                    //         MaterialPageRoute(builder: (context) => Profile()));
                    //   },
                    //   child: TextWidget(
                    //       text: "Sign In", fontSize: 16, isUnderLine: true),
                    // ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class TextInput extends StatelessWidget {
  final String textString;

  TextEditingController textController;
  final bool obscureText;
  var validate;
  TextInput(
      {Key? key,
      required this.textString,
      required this.textController,
      required this.obscureText,
      required this.validate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      style: const TextStyle(color: Color(0xFF000000)),
      cursorColor: const Color(0xFF9b9b9b),
      controller: textController,
      keyboardType: TextInputType.text,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Color(0xff06113C)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff06113C), width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        labelText: textString,
        hintStyle: const TextStyle(
            color: Color(0xFF9b9b9b),
            fontSize: 15,
            fontWeight: FontWeight.normal),
      ),
    );
  }
}

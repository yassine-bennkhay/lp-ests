import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lp_ests/screens/forget_password/forget_password.dart';
import 'package:lp_ests/screens/sign_up/sign_up.dart';
import 'package:lp_ests/screens/test.dart';
import 'dart:convert';
import './components/text_widget.dart';
// import '../singup_login/sing_up.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var isLoadingToSignIn = false;
  _login() async {
    setState(() {
      isLoadingToSignIn = true;
    });
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://192.168.0.122:4000/accounts/authenticate'));
    request.body = json.encode(
        {"email": emailController.text, "password": passwordController.text});
    request.headers.addAll(headers);
    var response = await request.send();
    if (response.statusCode == 200) {
      setState(() {
        isLoadingToSignIn = false;
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Test()));
    } else {
      print("we cant log you in right now!");
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                    text: "Connectez-vous", fontSize: 26, isUnderLine: false),
                TextWidget(
                    text: "à votre compte!", fontSize: 26, isUnderLine: false),
                SizedBox(height: height * 0.1),
                Form(
                  key: formKey,
                  child: Column(children: [
                    TextInput(
                      validateForm: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Une adresse email valide est requis';
                        }
                        return null;
                      },
                      textString: "Email",
                      textController: emailController,
                      hint: "Email",
                    ),
                    SizedBox(
                      height: height * .05,
                    ),
                    TextInput(
                      validateForm: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Un mot de passe est requis';
                        }
                        return null;
                      },
                      textString: "Password",
                      textController: passwordController,
                      hint: "Password",
                      // onSelectParam: (String) {},
                    ),
                  ]),
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
                          _login();
                        }
                      },
                      child: isLoadingToSignIn
                          ? const CircularProgressIndicator()
                          : const Text("Sign In"),
                    )),
                SizedBox(height: height * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      child: TextWidget(
                          text: "Sign up", fontSize: 16, isUnderLine: true),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgetPassword()));
                      },
                      child: TextWidget(
                          text: "Forgot Password",
                          fontSize: 16,
                          isUnderLine: true),
                    )
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
  final String hint;
  bool obscureText;
  var validateForm;
  TextInput(
      {Key? key,
      required this.textString,
      required this.textController,
      required this.hint,
      required this.validateForm,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validateForm,
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
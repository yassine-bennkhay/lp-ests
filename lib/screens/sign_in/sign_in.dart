import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lp_ests/models/user.dart';
import 'package:lp_ests/screens/forget_password/forget_password.dart';
import 'package:lp_ests/screens/home_page.dart';
import 'package:lp_ests/screens/sign_up/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  bool _passwordVisible = false;

  var userData = [];
  _login() async {
    setState(() {
      isLoadingToSignIn = true;
    });
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://192.168.83.2:4000/accounts/authenticate'));
    request.body = json.encode(
        {"email": emailController.text, "password": passwordController.text});
    request.headers.addAll(headers);
    var response = await request.send();

    if (response.statusCode == 200) {
      final respStr = await response.stream.bytesToString();
      var data = User.fromJson(jsonDecode(respStr));

      setState(() {
        isLoadingToSignIn = false;
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', data.email);
      prefs.setInt('id', data.id);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Color(0xff06113C),
        content: Text(
            "L'e-mail ou le mot de passe est incorrect ou l'e-mail n'est pas vérifié. Veuillez vérifier votre e-mail"),
        duration: Duration(seconds: 8),
      ));
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
                      obscureText: false,
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
                      obscureText: _passwordVisible,
                      validateForm: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Un mot de passe est requis';
                        }
                        return null;
                      },
                      textString: "Mot de passe",
                      textController: passwordController,
                      hint: "Mot de passe",
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
                          : const Text("Connexion"),
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
                          text: "S'inscrire", fontSize: 16, isUnderLine: true),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgetPassword()));
                      },
                      child: TextWidget(
                          text: "Mot de passe oublié?",
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

class TextInput extends StatefulWidget {
  final String textString;
  TextEditingController textController;
  final String hint;
  bool obscureText;
  var validateForm;
  Widget? iconButton;
  TextInput(
      {Key? key,
      required this.textString,
      required this.textController,
      required this.hint,
      required this.validateForm,
      required this.obscureText,
      this.iconButton})
      : super(key: key);

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validateForm,
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

import 'package:flutter/material.dart';
import 'package:lp_ests/screens/profile/forget_password.dart';
import 'package:lp_ests/screens/profile/sign_up.dart';
// import '../api/my_api.dart';
import './components/text_widget.dart';
// import '../singup_login/sing_up.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController textController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _showMsg(msg) {
    //
    final snackBar = SnackBar(
      backgroundColor: const Color(0xFF363f93),
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _login() async {
    var data = {
      'email': emailController.text,
      'password': textController.text,
    };

    //   var res = await CallApi().postData(data, 'login');
    //   var body = json.decode(res.body);
    //   print(body);
    //   if (body['success']) {
    //     SharedPreferences localStorage = await SharedPreferences.getInstance();
    //     localStorage.setString('token', body['token']);
    //     localStorage.setString('user', json.encode(body['user']));
    //     Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => ArticlePage()));
    //   } else {
    //     _showMsg(body['message']);
    //   }
    // }
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
                TextInput(
                  textString: "Email",
                  textController: emailController,
                  hint: "Email",
                ),
                SizedBox(
                  height: height * .05,
                ),
                TextInput(
                  textString: "Password",
                  textController: textController,
                  hint: "Password",
                  // onSelectParam: (String) {},
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
                      onPressed: () {},
                      child: const Text("Sign In"),
                    )),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     TextWidget(
                //         text: "Sign in", fontSize: 22, isUnderLine: false),
                //     GestureDetector(
                //         onTap: () {
                //           _login();
                //         },
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
  TextInput(
      {Key? key,
      required this.textString,
      required this.textController,
      required this.hint,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
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

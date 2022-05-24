import 'package:flutter/material.dart';
import 'package:lp_ests/screens/profile/sign_in.dart';

import 'components/text_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController passController = TextEditingController();
  TextEditingController repassController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // _register() async {
  //   var data = {
  //     'name'  :nameController.text,
  //     'email' : emailController.text,
  //     'password' : passController.text,
  //   };
  //   debugPrint(nameController.text);
  //   debugPrint(emailController.text);
  //   debugPrint(passController.text);
  //   debugPrint(repassController.text);

  //   var res = await CallApi().postData(data, 'register');
  //   var body = json.decode(res.body);
  //   print(body);
  //   if(body['success']){
  //     //SharedPreferences localStorage = await SharedPreferences.getInstance();
  //     // localStorage.setString('token', body['token']);
  //     //localStorage.setString('user', json.encode(body['user']));
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) => FilierHome()));
  //   }
  // }
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
                TextWidget(text: "Criez", fontSize: 26, isUnderLine: false),
                TextWidget(
                    text: "votre compte!", fontSize: 26, isUnderLine: false),
                SizedBox(height: height * 0.1),
                TextInput(
                    textString: 'Email',
                    textController: emailController,
                    obscureText: true),
                SizedBox(
                  height: height * .05,
                ),
                TextInput(
                  textString: "Password",
                  textController: passController,
                  obscureText: true,
                  // onSelectParam: (String) {},
                ),
                SizedBox(
                  height: height * .05,
                ),
                TextInput(
                  textString: "Confirmer votre Password",
                  textController: passController,
                  obscureText: true,
                ),
                SizedBox(
                  height: height * .05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                        text: "Sign Up", fontSize: 22, isUnderLine: false),
                    GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF363f93),
                          ),
                          child: const Icon(Icons.arrow_forward,
                              color: Colors.white, size: 30),
                        ))
                  ],
                ),
                SizedBox(height: height * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      child: TextWidget(
                          text: "Sign In", fontSize: 16, isUnderLine: true),
                    ),
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
  TextInput(
      {Key? key,
      required this.textString,
      required this.textController,
      required this.obscureText})
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
        hintText: textString,
        hintStyle: const TextStyle(
            color: Color(0xFF9b9b9b),
            fontSize: 15,
            fontWeight: FontWeight.normal),
      ),
    );
  }
}
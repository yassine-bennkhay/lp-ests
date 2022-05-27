import 'package:flutter/material.dart';
import 'package:lp_ests/screens/profile/sign_in.dart';

import 'components/text_widget.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();
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
                    text: "Réinitialisez", fontSize: 26, isUnderLine: false),
                TextWidget(
                    text: "votre mot de passe",
                    fontSize: 26,
                    isUnderLine: false),
                SizedBox(height: height * 0.1),
                TextInput(
                  textString: "Email",
                  textController: emailController,
                  hint: "Email",
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
                      child: const Text("Réinitialisez"),
                    )),
                // SizedBox(height: height * 0.1),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         // Navigator.push(
                //         //     context,
                //         //     MaterialPageRoute(
                //         //         builder: (context) => const SignUp()));
                //       },
                //       child: TextWidget(
                //           text: "Sign up", fontSize: 16, isUnderLine: true),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ));
  }
}

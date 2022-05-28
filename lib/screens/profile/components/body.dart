import 'package:flutter/material.dart';
import 'package:lp_ests/constants/constants.dart';
import 'package:lp_ests/screens/profile/components/profile_menu.dart';
import 'package:lp_ests/screens/profile/components/profile_pic.dart';
import 'package:lp_ests/screens/sign_in/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatelessWidget {
  Future<String?> getCurrentEmail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var email = sharedPreferences.getString('email');
    return email;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const Center(child: ProfilePic()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 40,
              width: double.infinity,
              child: Center(
                  child: FittedBox(
                      child: Padding(
                padding: const EdgeInsets.only(right: 4, left: 4),
                child: FutureBuilder<String?>(
                  future: getCurrentEmail(),
                  builder: (Buildcontext, AsyncSnapshot<String?> snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data!);
                    }
                    return const CircularProgressIndicator(
                      color: kPrimaryColor,
                    );
                  },
                ),
              ))),
            ),
          ),
          ProfileMenu(
            press: () {},
            text: "Ma candidature ",
            icon: "assets/icons/User Icon.svg",
          ),
          ProfileMenu(
            text: " Paramètres",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Centre d'aide",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Se déconnecter",
            icon: "assets/icons/Log out.svg",
            press: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('email');
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext ctx) => SignIn()));
            },
          ),
        ],
      ),
    );
  }
}

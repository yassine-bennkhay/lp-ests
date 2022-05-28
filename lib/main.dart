import 'package:flutter/material.dart';
import 'package:lp_ests/screens/home_page.dart';
import 'package:lp_ests/screens/sign_in/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: email == null ? SignIn() : const MyHomePage()));
}

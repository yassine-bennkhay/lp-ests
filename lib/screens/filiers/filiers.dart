import 'package:flutter/material.dart';
import 'package:lp_ests/screens/filiers/components/filier_home.dart';



class Filiers extends StatelessWidget {
  const Filiers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: FilierHome(),
    );
  }
}

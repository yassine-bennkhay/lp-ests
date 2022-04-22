import 'package:flutter/material.dart';
import 'package:lp_ests/screens/filiers/components/filier_body.dart';

import '../../size_config.dart';

class Filiers extends StatelessWidget {
  const Filiers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: FilierHome(),
    );
  }
}

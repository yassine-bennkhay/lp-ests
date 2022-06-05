import 'package:flutter/material.dart';
import 'package:lp_ests/models/licenses.dart';
import 'package:lp_ests/screens/filiers/details/components/body.dart';

import '../../../constants/constants.dart';

class DetailsScreen extends StatelessWidget {
  final License license;

  const DetailsScreen({required this.license});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(context),
      body: Body(license: license),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    var kDefaultPaddin2 = kDefaultPaddin;
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
    );
  }
}

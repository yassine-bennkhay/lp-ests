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
      backgroundColor: const Color(0xff5584F1),
      appBar: buildAppBar(context),
      body: Body(license: license),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    var kDefaultPaddin2 = kDefaultPaddin;
    return AppBar(
      backgroundColor: const Color(0xff5584F1),
      elevation: 0,
      // leading: IconButton(
      //   icon: SvgPicture.asset(
      //     'assets/icons/back.svg',
      //     color: Colors.white,
      //   ),
      //   onPressed: () => Navigator.pop(context),
      // ),
    );
  }
}

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
      // each product have a color
      backgroundColor: Colors.green,
      appBar: buildAppBar(context),
      body: Body(license: license),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    var kDefaultPaddin2 = kDefaultPaddin;
    return AppBar(
      backgroundColor: Colors.green,
      elevation: 0,
      // leading: IconButton(
      //   icon: SvgPicture.asset(
      //     'assets/icons/back.svg',
      //     color: Colors.white,
      //   ),
      //   onPressed: () => Navigator.pop(context),
      // ),
      actions: <Widget>[
        // IconButton(
        //   icon: SvgPicture.asset("assets/icons/search.svg"),
        //   onPressed: () {},
        // ),
        // IconButton(
        //   icon: SvgPicture.asset("assets/icons/cart.svg"),
        //   onPressed: () {},
        // ),
        SizedBox(width: kDefaultPaddin2 / 2)
      ],
    );
  }
}

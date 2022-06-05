import 'package:flutter/material.dart';
import 'package:lp_ests/screens/filiers/details/components/license_title.dart';

import '../../../../constants/constants.dart';
import '../../../../models/licenses.dart';

import 'description.dart';

class Body extends StatelessWidget {
  final License license;

  const Body({required this.license});
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: size.height * 0.2),
                    padding: EdgeInsets.only(
                      top: size.height * 0.01,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin,
                    ),
                    // height: 500,
                    decoration: const BoxDecoration(
                      color: Color(0xffF1F2F7),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: ListView(
                      children: [
                        //ColorAndSize(license: license),
                        Description(license: license)
                      ],
                    )),
                LicenseTitle(license: license)
              ],
            ),
          )
        ],
      ),
    );
  }
}

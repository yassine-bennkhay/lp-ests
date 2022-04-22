import 'package:flutter/material.dart';
import 'package:lp_ests/screens/filiers/details/components/color_and_size.dart';

import '../../../../constants/constants.dart';
import '../../../../models/licenses.dart';

import 'description.dart';
import 'license_title_and_image.dart';

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
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  // height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ColorAndSize(
                        license: license,
                      ),
                      const SizedBox(height: kDefaultPaddin / 2),
                      Description(
                        license: license,
                      ),
                      const SizedBox(height: kDefaultPaddin / 2),
                      const SizedBox(height: kDefaultPaddin / 2),
                    ],
                  ),
                ),
                LicenseTitleAndImage(license: license)
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lp_ests/models/licenses.dart';

import '../../../../constants/constants.dart';

class LicenseTitle extends StatelessWidget {
  const LicenseTitle({
    required this.license,
  });

  final License license;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            license.name,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lp_ests/models/licenses.dart';

import '../../../../constants/constants.dart';

class Description extends StatelessWidget {
  const Description({
    required this.license,
  });

  final License license;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        license.description,
        style: const TextStyle(height: 1.5),
      ),
    );
  }
}

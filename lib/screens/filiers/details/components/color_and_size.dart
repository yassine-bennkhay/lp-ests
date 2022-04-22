import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../models/licenses.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({
    required this.license,
  });

  final License license;

  @override
  Widget build(BuildContext context) {
    var kTextColor2 = kTextColor;
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[],
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: kTextColor2),
              children: [
                TextSpan(
                  text: license.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

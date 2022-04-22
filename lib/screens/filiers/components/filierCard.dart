import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
import '../../../models/licenses.dart';

class LicenseCard extends StatelessWidget {
  final License license;
  var press;
  LicenseCard({
    required this.license,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPaddin),
              // For  demo we use fixed height  and width
              // Now we dont need them
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              // child: Hero(
              //   tag: "${license.id}",
              //   child: Image.asset(product.image),
              // ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              license.name,
              style: const TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "\$${license.name}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lp_ests/models/licenses.dart';


import '../../../../constants/constants.dart';


class LicenseTitleAndImage extends StatelessWidget {
  const LicenseTitleAndImage({
  
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
          const Text(
            "Aristocratic Hand Bag",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            license.name,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: kDefaultPaddin),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: "Price\n"),
                    TextSpan(
                      text: "\$${license.name}",
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: kDefaultPaddin),
              // Expanded(
              //   child: Hero(
              //     tag: "${license.id}",
              //     child: Image.asset(
              //       product.image,
              //       fit: BoxFit.fill,
              //     ),
              //   ),
              // )
            ],
          )
        ],
      ),
    );
  }
}
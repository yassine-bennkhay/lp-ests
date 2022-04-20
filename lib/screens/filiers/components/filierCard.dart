import 'package:flutter/material.dart';
import '../../../models/licenses.dart';

import '../../../size_config.dart';

class LicenseCard extends StatelessWidget {
  final Licenses license;
  final Function press;

  const LicenseCard({Key? key, required this.license, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.screenWidth;
    // Now we dont this Aspect ratio
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(defaultSize * 0.04), //18
        ),
        // child: Row(
        //   children: <Widget>[
        //     Expanded(
        //       child: Padding(
        //         padding: const EdgeInsets.all(20), //20
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: <Widget>[
        //             const Text(
        //               "license.name",
        //               style: TextStyle(
        //                   fontSize: 10, //22
        //                   color: Colors.black),
        //             ),
        //             // 5
        //             const Text(
        //               "license.description",
        //               style: TextStyle(color: Colors.white54),
        //               maxLines: 2,
        //               overflow: TextOverflow.ellipsis,
        //             ),

        //             buildInfoRow(
        //               defaultSize,
        //               text: "${license.name} Recipes",
        //             ),
        //             //5
        //             buildInfoRow(
        //               defaultSize,
        //               text: "${license.name} Chefs",
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),

        //     //5
        //     // AspectRatio(
        //     //   aspectRatio: 0.71,
        //     //   child: Image.asset(
        //     //     recipeBundle.imageSrc,
        //     //     fit: BoxFit.cover,
        //     //     alignment: Alignment.centerLeft,
        //     //   ),
        //     // )
        //   ],
        // ),
      ),
    );
  }

  Row buildInfoRow(double defaultSize, {text}) {
    return Row(
      children: <Widget>[
        SizedBox(width: defaultSize), // 10
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
          ),
        )
      ],
    );
  }
}

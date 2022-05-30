import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lp_ests/models/licenses.dart';
import '../../../constants/constants.dart';

class FilierHome extends StatefulWidget {
  @override
  State<FilierHome> createState() => _FilierHomeState();
}

class _FilierHomeState extends State<FilierHome> {
  Future fetchAllLicenses() async {
    final response =
        await http.get(Uri.parse('http://192.168.0.123:4000/fils'));
    if (response.statusCode == 200) {
      var licenseData = LicenseList.fromJson(jsonDecode(response.body));
      print(licenseData.licenses[0].name);
    } else {
      throw Exception('we cant load your data ');
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchAllLicenses();
    return Container(
      color: const Color(0xffF1F2F7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: Text(
              "Les licenses professionnelles",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          //     child: GridView.builder(
          //         itemCount: .length,
          //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 2,
          //           mainAxisSpacing: kDefaultPaddin,
          //           crossAxisSpacing: kDefaultPaddin,
          //           childAspectRatio: 0.75,
          //         ),
          //         itemBuilder: (context, index) => LicenseCard(
          //             license: licenses[index],
          //             press: () {
          //               Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                     builder: (context) => DetailsScreen(
          //                       license: licenses[index],
          //                     ),
          //                   ));
          //             })),
          //   ),
          // ),
        ],
      ),
    );
  }
}

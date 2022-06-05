import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lp_ests/models/licenses.dart';
import 'package:lp_ests/screens/filiers/components/license_card.dart';
import '../../../constants/constants.dart';
import '../details/details_screen.dart';

class FilierHome extends StatefulWidget {
  @override
  State<FilierHome> createState() => _FilierHomeState();
}

List licenses = [];

class _FilierHomeState extends State<FilierHome> {
  Future fetchAllLicenses() async {
    final response = await http.get(Uri.parse('http://192.168.83.2:4000/fils'));
    if (response.statusCode == 200) {
      var licenseData = LicenseList.fromJson(jsonDecode(response.body));
      return licenseData.licenses;
    } else {
      throw Exception('we cant load your data ');
    }
  }

  @override
  Widget build(BuildContext context) {
    // fetchAllLicenses();
    return Container(
      color: const Color(0xffF1F2F7),
      child: Column(
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
          FutureBuilder(
            future: fetchAllLicenses(), // async work
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 1.3,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    ),
                  );

                default:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPaddin),
                        child: GridView.builder(
                            itemCount: snapshot.data.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: kDefaultPaddin,
                              crossAxisSpacing: kDefaultPaddin,
                              childAspectRatio: 0.75,
                            ),
                            itemBuilder: (context, index) => LicenseCard(
                                license: snapshot.data[index],
                                press: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailsScreen(
                                          license: snapshot.data[index],
                                        ),
                                      ));
                                })),
                      ),
                    );
                  }
              }
            },
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lp_ests/constants/constants.dart';

class CandidatData extends StatefulWidget {
  const CandidatData({Key? key}) : super(key: key);

  @override
  State<CandidatData> createState() => _CandidatDataState();
}

class _CandidatDataState extends State<CandidatData> {
  List userData = ['Yassine', 'Bennkhay', 'Programming'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Ma candidature"),
        backgroundColor: kPrimaryColor,
      ),
      body: ListView.builder(
          itemCount: userData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                color: kCardColor,
                child: ListTile(
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {},
                  ),
                  title: Text("${userData[index]}"),
                  subtitle: const Text("test"),
                  leading: SvgPicture.asset("assets/icons/User Icon.svg"),
                ),
              ),
            );
          }),
    );
  }
}

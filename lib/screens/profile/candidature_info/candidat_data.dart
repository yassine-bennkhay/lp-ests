import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lp_ests/constants/constants.dart';

class CandidatData extends StatefulWidget {
  const CandidatData({Key? key}) : super(key: key);

  @override
  State<CandidatData> createState() => _CandidatDataState();
}

bool isTimeEnded = false;

class _CandidatDataState extends State<CandidatData> {
  List userData = ['Yassine', 'Bennkhay', 'Programming'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Candidature"),
          backgroundColor: kPrimaryColor,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(8)),
                width: double.infinity,
                height: 100,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "you dont have the right to edit after the time end",
                        style: TextStyle(color: Colors.white),
                      ),
                      CountdownTimer(
                        textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        endWidget: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                                "le temps est écoulé, vous n'avez plus le droit de modifier votre candidature."),
                          ),
                        ),
                        endTime: 16541001400000,
                        onEnd: () {
                          Future.delayed(Duration.zero, () async {
                            setState(() {
                              isTimeEnded = true;
                            });
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: userData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 1, horizontal: 4),
                      child: Card(
                        color: kCardColor,
                        child: ListTile(
                          trailing: IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: isTimeEnded ? null : () {},
                          ),
                          title: Text("${userData[index]}"),
                          subtitle: const Text("test"),
                          leading:
                              SvgPicture.asset("assets/icons/User Icon.svg"),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}


// CountdownTimer(
//           endWidget: const Center(
//             child: Text(
//                 "le temps est écoulé, vous n'avez plus le droit de modifier votre candidat"),
//           ),
//           endTime: 1654097703000,
//           onEnd: () {
//             setState(() {
//               isTimeEnded = true;
//             });
//           },
//         ),


// ListView.builder(
//           itemCount: userData.length,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
//               child: Card(
//                 color: kCardColor,
//                 child: ListTile(
//                   trailing: IconButton(
//                     icon: const Icon(Icons.edit),
//                     onPressed: isTimeEnded ? null : () {},
//                   ),
//                   title: Text("${userData[index]}"),
//                   subtitle: const Text("test"),
//                   leading: SvgPicture.asset("assets/icons/User Icon.svg"),
//                 ),
//               ),
//             );
//           }),
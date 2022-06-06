import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:lp_ests/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lp_ests/constants/error.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CandidatData extends StatefulWidget {
  const CandidatData({Key? key}) : super(key: key);

  @override
  State<CandidatData> createState() => _CandidatDataState();
}

bool isTimeEnded = false;
var studentData = [];

class _CandidatDataState extends State<CandidatData> {
  List userData = ['Yassine', 'Bennkhay', 'Programming'];
  List keys = ['prenomFr', 'nomFr'];
  //var userDataObject;
  Future getUserData() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    var studentId = shared.getInt('id');

    final response = await http
        .get(Uri.parse(baseUrl+'/candidat/$studentId'));
    if (response.statusCode == 200) {
      var studentJsonData = jsonDecode(response.body);
      setState(() {
        studentData = studentJsonData;
      });

    } else {
      throw Exception('Failed to fetch user data');
    }
  }

  late bool isLoading;
  @override
  void initState() {
    isLoading = true;
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //getUserData();
    List<Widget> builder() {
      List<Widget> l = [];
      final Map<String, dynamic> newMap = {};
      newMap['Prénom']=studentData[0]['prenomFr'];
      newMap['Prénom en Arabe']=studentData[0]['prenomAr'];
      newMap['Nom']=studentData[0]['nomFr'];
      newMap['Nom en Arabe']=studentData[0]['nomAr'];
      newMap['Email']=studentData[0]['email'];
      newMap['Carte Nationale d\'identité']=studentData[0]['CIN'];
      newMap['Code national d\'étudiant']=studentData[0]['CNE'];
      newMap['Date de naissance']=studentData[0]['DateDeNaissance'].substring(0,10);
      newMap['Adresse']=studentData[0]['Adresse'];
      newMap['Telephone']=studentData[0]['Tel'];

     newMap.forEach((k, v) => l.add(Card(
            color: kCardColor,
            child: ListTile(
              contentPadding: const EdgeInsets.all(8.0),
              title: Text(k),

              trailing: Text(v.toString()),
            ),
          )));
      return l;
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Candidature"),
          backgroundColor: kPrimaryColor,
        ),
        body: studentData.isEmpty?const Error(): Column(
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
                      const Center(
                        child:  Padding(
                          padding: EdgeInsets.only(left: 20.0,right: 20),
                          child: Text(
                            "vous avez toujours le droit de modifier votre candidature tant que le délai n'est pas encore écoulé.",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
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
                        endTime: 1655756000000,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: Colors.green,
                ),
                onPressed:isTimeEnded?(){}:null,
                child: const Center(
                  child: Text(
                    "Modifier mes informations",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
             // child: Text(";fadf"),
              child: SingleChildScrollView(child: Column(

                  children: isLoading? [

                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: kPrimaryColor,
                        ),
                      ),
                    )]:builder())),
              // child: ListView.builder(
              //     itemCount: studentData[0].length,
              //     itemBuilder: (context, index) {
              //       return Padding(
              //         padding: const EdgeInsets.symmetric(
              //             vertical: 1, horizontal: 4),
              //         child: Card(
              //             color: kCardColor,
              //             child: Container(
              //                 child: SingleChildScrollView(
              //               padding: const EdgeInsets.all(16.0),
              //               child: Column(
              //                   children: studentData[0]
              //                       .entries
              //                       .map((entry) => ListTile(
              //                             contentPadding:
              //                                 const EdgeInsets.all(16.0),
              //                             title: Text(entry.key),
              //                             trailing:
              //                                 Text(entry.value.toString()),
              //                           ))),
              //             ))),
              //       );
              //     }),
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
import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  const Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Center(
            child: Image.asset('assets/images/error.png'),

          ),
          const Text('Erreur de connexion!',style: TextStyle(fontWeight: FontWeight.bold),)

        ]
    );
  }
}

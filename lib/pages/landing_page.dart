import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/pages/notes.dart';
import 'package:task_manager/pages/sign_up_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final bool isLogged = false;


  @override
  Widget build(BuildContext context) {
    return
      isLogged ?
      Notes() :
        StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Notes();
            }
            else {
              return SignUp();
            }
          },
        );
  }
}

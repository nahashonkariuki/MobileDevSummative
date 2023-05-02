import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_mobile_app_idea/login_screen.dart';
import 'firebase_options.dart';
import 'main.dart';
import 'signup_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => FutureBuilder(
                      future: Firebase.initializeApp(
                        options: DefaultFirebaseOptions.currentPlatform,
                      ),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        // switch(snapshot.connectionState){
                        //   case ConnectionState.none:
                        //     // TODO: Handle this case.
                        //     break;
                        //   case ConnectionState.waiting:
                        //     // TODO: Handle this case.
                        //     break;
                        //   case ConnectionState.active:
                        //     // TODO: Handle this case.
                        //     break;
                        //   case ConnectionState.done:
                        //     // TODO: Handle this case.
                        //     break;
                        // }
                        return SignUpPage();
                      },
                    ))));

    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/eventease-high-resolution-color-logo.png'),
                fit: BoxFit.cover),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

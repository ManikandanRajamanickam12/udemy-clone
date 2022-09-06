import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemyclone/pages/home_page.dart';
import 'package:udemyclone/pages/landing_page.dart';
import 'package:udemyclone/services/storage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SecureStorage secureStorage = SecureStorage();
  String? finalEmail, finalName;
  @override
  void initState() {
    // TODO: implement initState

    secureStorage.readSecureData("email").then(
      (value) {
        finalEmail = value;
        print(finalEmail);
      },
    );
    secureStorage.readSecureData("name").then(
      (value) {
        finalName = value;
      },
    );

    Timer(
        Duration(seconds: 3),
        (() => Navigator.pushReplacement(
            context,
            PageTransition(
                child: finalEmail == null ? LandingPage() : HomePage(),
                type: PageTransitionType.rightToLeftWithFade))));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 500, height: 300, child: Image.asset("assets/logo.png")),
            const Padding(
              padding: EdgeInsets.only(top: 50),
              child: CircularProgressIndicator(
                backgroundColor: Colors.black,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemyclone/pages/home_page.dart';
import 'package:udemyclone/pages/sign_up.dart';
import 'package:udemyclone/services/auth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  Authentication authentication = Authentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/landing.png"),
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: Text(
              "Sign in",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: FlatButton.icon(
                onPressed: (() async {
                  await authentication.googleSignIn();
                }),
                icon: Icon(EvaIcons.email),
                color: Colors.white,
                label: Text("Sign In with Email")),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Row(
              children: [
                SizedBox(width: 180, child: Divider(color: Colors.white)),
                Text(
                  "or",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 180, child: Divider(color: Colors.white)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: FlatButton.icon(
                onPressed: (() async {
                  await authentication.googleSignIn().whenComplete(() {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: HomePage(),
                            type: PageTransitionType.rightToLeftWithFade));
                  });
                }),
                icon: Icon(EvaIcons.google),
                color: Colors.white,
                label: Text("Sign In with Google")),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: FlatButton.icon(
                onPressed: (() {}),
                icon: Icon(EvaIcons.facebook),
                color: Colors.white,
                label: Text("Sign In with Facebook")),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: FlatButton.icon(
                onPressed: (() {}),
                icon: Icon(FontAwesomeIcons.apple),
                color: Colors.white,
                label: Text("Sign In with Apple")),
          ),
          Container(
            width: 215,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "New here?",
                  style: TextStyle(color: Colors.white),
                ),
                MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: SignUpPage(),
                              type: PageTransitionType.rightToLeftWithFade));
                    },
                    child: Text(
                      "Create an account",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    ));
  }
}

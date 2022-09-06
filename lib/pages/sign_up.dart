import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemyclone/pages/sign_in.dart';
import 'package:udemyclone/services/auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Authentication authentication = Authentication();
  @override
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
            padding: EdgeInsets.only(bottom: 200),
            child: Text(
              "Sign Up",
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
            width: 255,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Already have a account?",
                  style: TextStyle(color: Colors.white),
                ),
                MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: SignInPage(),
                              type: PageTransitionType.rightToLeft));
                    },
                    child: Text(
                      "Login Here",
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

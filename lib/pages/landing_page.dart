import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemyclone/pages/sign_in.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        // appBar: AppBar(
        //   backgroundColor: Colors.redAccent,
        //   centerTitle: true,
        //   title: Text("Landing Page"),
        // ),

        body: Container(
          child: SizedBox(
            height: 400,
            width: 400,
            child: Image.asset(
              "assets/landing.png",
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {},
                child: Text(
                  "Browse",
                  style: TextStyle(color: Colors.grey.shade300, fontSize: 20),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: SignInPage(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Text("Sign in",
                    style:
                        TextStyle(color: Colors.grey.shade300, fontSize: 20)),
              )
            ],
          ),
        ));
  }
}

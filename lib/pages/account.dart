import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemyclone/pages/landing_page.dart';
import 'package:udemyclone/services/auth.dart';
import 'package:udemyclone/services/storage.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Authentication authentication = Authentication();
  SecureStorage secureStorage = SecureStorage();
  String? finalEmail, finalName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    secureStorage.readSecureData("email").then(
      (value) {
        setState(() {
          finalEmail = value;
        });
      },
    );
    secureStorage.readSecureData("name").then(
      (value) {
        setState(() {
          finalName = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(EvaIcons.shoppingCartOutline))
        ],
        title: const Text(
          "Account",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 400,
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    finalName == null ? "loading" : finalName.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: 280,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            EvaIcons.google,
                            color: Colors.white,
                          ),
                          Text(
                              finalEmail == null
                                  ? "loading"
                                  : finalEmail.toString(),
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: MaterialButton(
                      onPressed: () {},
                      child: const Text("Become an Instructor",
                          style: TextStyle(
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "Video preference",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const ListTile(
                title: Text(
                  "Download Options",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )),
            const ListTile(
                title: Text(
                  "Video playback options",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )),
            const Text(
              "Account Setting",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const ListTile(
                title: Text(
                  "Account Security",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )),
            const ListTile(
                title: Text(
                  "Email Notification Preference",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )),
            const ListTile(
                horizontalTitleGap: 0,
                leading: Text(
                  "Learning Reminders",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                title: Padding(
                  padding: EdgeInsets.only(right: 150),
                  child: Icon(
                    EvaIcons.info,
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )),
            const Text(
              "Support",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const ListTile(
                title: Text(
                  "About Udemy",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )),
            const ListTile(
                title: Text(
                  "About Udemy for business",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )),
            const ListTile(
                title: Text(
                  "FAQ's",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )),
            const ListTile(
                title: Text(
                  "Share the Udemy app",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )),
            const Text(
              "Diagnostics",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const ListTile(
                title: Text(
                  "Status",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )),
            Center(
              child: MaterialButton(
                onPressed: () {
                  authentication.googleSignOut().whenComplete(() {
                    secureStorage.deleteSecureData("email");
                  }).whenComplete(() {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: LandingPage(),
                            type: PageTransitionType.bottomToTop));
                  });
                },
                child: const Text(
                  "Sign Out",
                  style: TextStyle(color: Colors.lightBlue),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(25),
              child: Center(
                child: Text(
                  "Udemy v1.0.0",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

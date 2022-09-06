import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemyclone/pages/category.dart';
import 'package:udemyclone/pages/mylist.dart';
import 'package:udemyclone/services/datacontroller.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            "Wishlist",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: MyList(),
                          type: PageTransitionType.leftToRightWithFade));
                },
                icon: const Icon(
                  EvaIcons.shoppingCartOutline,
                  color: Colors.white,
                ))
          ],
        ),
        body:

            // SingleChildScrollView(
            //   child: Column(
            //     children: [
            //       SizedBox(
            //         width: 400,
            //         height: 300,
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.only(top: 50),
            //               child: CircleAvatar(
            //                 child: Icon(
            //                   EvaIcons.shakeOutline,
            //                   color: Colors.white,
            //                 ),
            //                 radius: 50,
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.only(top: 20),
            //               child: Text(
            //                 "Want to save something for later?",
            //                 style: TextStyle(color: Colors.white, fontSize: 22),
            //               ),
            //             ),
            //             Padding(
            //               padding: const EdgeInsets.only(top: 15),
            //               child: Text(
            //                 "Your wishlist will go here.",
            //                 style:
            //                     TextStyle(color: Colors.grey.shade100, fontSize: 16),
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //       Column(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Text(
            //               "Browse Categories",
            //               style: TextStyle(color: Colors.grey.shade100, fontSize: 20),
            //             ),
            //           ),
            //           Container(
            //             height: 280,
            //             child: Category(),
            //           ),
            //         ],
            //       ),
            //       SizedBox(
            //         height: 50,
            //       )
            //     ],
            //   ),
            // ),
            FutureBuilder(
          future: Datacontroller.getData('wishlist'),
          builder: (context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 70,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(snapshot
                                              .data[index]
                                              .data()["image"]),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10)),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data[index]["title"],
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    snapshot.data[index]["author"],
                                    style: TextStyle(
                                        color: Colors.grey.shade800,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        EvaIcons.star,
                                        color: Colors.yellowAccent,
                                        size: 15,
                                      ),
                                      Icon(
                                        EvaIcons.star,
                                        color: Colors.yellowAccent,
                                        size: 15,
                                      ),
                                      Icon(
                                        EvaIcons.star,
                                        color: Colors.yellowAccent,
                                        size: 15,
                                      ),
                                      Icon(
                                        EvaIcons.star,
                                        color: Colors.yellowAccent,
                                        size: 15,
                                      ),
                                      Icon(
                                        EvaIcons.star,
                                        color: Colors.yellowAccent,
                                        size: 15,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          snapshot.data[index]["ratings"]
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          ('(${snapshot.data[index]["enrolled"].toString()})'),
                                          style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.currency_rupee,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                        Text(
                                          snapshot.data[index]["price"]
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    })),
              );
            }
          },
        ));
  }
}

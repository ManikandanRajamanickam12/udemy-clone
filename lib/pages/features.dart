import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemyclone/pages/detsils.dart';
import 'package:udemyclone/pages/mylist.dart';
import 'package:udemyclone/services/datacontroller.dart';

class Featured extends StatefulWidget {
  const Featured({Key? key}) : super(key: key);

  @override
  State<Featured> createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: MyList(),
                          type: PageTransitionType.rightToLeftWithFade));
                },
                icon: Icon(EvaIcons.shoppingCartOutline))
          ],
          title: Text(
            "Featured",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: 500,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/coupen.jpg"),
                          fit: BoxFit.cover)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 400,
                  height: 80,
                  color: Colors.blueAccent,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Courses now on Sale",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        "Explore ",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8, top: 12),
                child: Text(
                  "Featured",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                  width: 400,
                  height: 300,
                  child: FutureBuilder(
                    future: Datacontroller.getData('featured'),
                    builder: (context, AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.black,
                          ),
                        );
                      } else {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: ((context, index) {
                              return GestureDetector(
                                onTap: (() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => Details(
                                              data: snapshot.data[index]))));
                                }),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 120,
                                          width: 200,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              image: DecorationImage(
                                                  fit: BoxFit.fitWidth,
                                                  image: NetworkImage(snapshot
                                                      .data[index]['image']
                                                      .toString()))),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 8),
                                          constraints:
                                              BoxConstraints(maxWidth: 260),
                                          child: Text(
                                            snapshot.data[index]["title"]
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                        ),
                                        Container(
                                          width: 250,
                                          padding: EdgeInsets.only(top: 5),
                                          child: Text(
                                            snapshot.data[index]["author"]
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              EvaIcons.star,
                                              color: Colors.yellowAccent,
                                            ),
                                            Icon(
                                              EvaIcons.star,
                                              color: Colors.yellowAccent,
                                            ),
                                            Icon(
                                              EvaIcons.star,
                                              color: Colors.yellowAccent,
                                            ),
                                            Icon(
                                              EvaIcons.star,
                                              color: Colors.yellowAccent,
                                            ),
                                            Icon(
                                              EvaIcons.star,
                                              color: Colors.yellowAccent,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: Text(
                                                snapshot.data[index]["ratings"]
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.grey.shade600,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
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
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.currency_rupee,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                snapshot.data[index]["price"]
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.yellow,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            padding: EdgeInsets.all(8),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Bestseller",
                                              style: TextStyle(
                                                  color: Colors.brown,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }));
                      }
                    },
                  ))
            ])));
  }
}

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:udemyclone/services/videoplayer.dart';

class Details extends StatefulWidget {
  Details({Key? key, required this.data}) : super(key: key);

  QueryDocumentSnapshot data;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, actions: [
        IconButton(
          onPressed: (() {}),
          icon: Icon(Icons.share),
        ),
        IconButton(
          onPressed: (() {}),
          icon: Icon(Icons.shop_2_outlined),
        )
      ]),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.data["title"],
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Container(
                width: 380,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                alignment: Alignment.center,
                child: Text(
                  widget.data["about"],
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 75,
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        Text(
                          widget.data["ratings"],
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 145,
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        Text(
                          "${widget.data["enrolled"]}  enrolled",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 100,
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        Text(
                          widget.data["language"],
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Center(
                child: Container(
                  width: 200,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white)),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.data["author"],
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.white,
                            fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("tapped");
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 200,
                          child: new AlertDialog(
                            title: new Text(
                              widget.data["title"],
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            content: VideoDisplay(
                              videourl: widget.data['trailer'],
                            ),
                          ),
                        );
                      });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 400,
                    height: 180,
                    child: Center(
                      child: Stack(children: [
                        Container(
                          height: 300,
                          width: 400,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(widget.data["image"]),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black45, BlendMode.darken)),
                          ),
                        ),
                        const Positioned(
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 50,
                          ),
                          top: 50,
                          left: 150,
                        ),
                        const Positioned(
                          child: Text(
                            "Preview this Course",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          top: 150,
                          left: 95,
                        )
                      ]),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: 350,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Buy Now"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white)),
                    alignment: Alignment.center,
                    child: Text(
                      "ADD TO CARD",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: (() async {
                      await FirebaseFirestore.instance
                          .collection("wishlist")
                          .add({
                        "title": widget.data["title"],
                        "image": widget.data["image"],
                        "author": widget.data["author"],
                        "ratings": widget.data["ratings"],
                        "price": widget.data["price"],
                        "enrolled": widget.data["enrolled"],
                        "language": widget.data["language"],
                      }).whenComplete(
                              () => ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor: Colors.grey,
                                        content: Text(
                                          "${widget.data["title"]} is added to  Wishlist",
                                          style: TextStyle(color: Colors.black),
                                        )),
                                  ));
                    }),
                    child: Container(
                      width: 180,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white)),
                      alignment: Alignment.center,
                      child: Text(
                        "ADD TO WISHLIST",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              )
            ]),
      )),
    );
  }
}

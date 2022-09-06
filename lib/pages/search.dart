import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:udemyclone/services/datacontroller.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController textEditingController = TextEditingController();
  QuerySnapshot? data;

  bool isExecute = false;
  String? url, title, author;
  @override
  Widget build(BuildContext context) {
    Widget searchedData(String url, String title, String author) {
      return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(url),
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          author,
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.clear),
      ),
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: TextField(
            controller: textEditingController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                hintText: "Search Courses",
                hintStyle: TextStyle(color: Colors.white)),
          ),
          actions: [
            FutureBuilder(
                future: Datacontroller.querytData(textEditingController.text),
                builder: (context, AsyncSnapshot snapshot) {
                  return SizedBox(
                    width: 50,
                    height: 25,
                    child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: ((context, index) {
                          return IconButton(
                              onPressed: (() {
                                url = snapshot.data[index]["image"];
                                title = snapshot.data[index]["title"];
                                author = snapshot.data[index]["author"];
                                setState(() {
                                  isExecute = true;
                                  textEditingController.clear();
                                });
                              }),
                              icon: Icon(Icons.search));
                        })),
                  );
                })
          ]),
      body: isExecute
          ? searchedData(url!, title!, author!)
          : Container(
              child: Center(
                  child: Text(
                "Search any courses",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              )),
            ),
    );
  }
}

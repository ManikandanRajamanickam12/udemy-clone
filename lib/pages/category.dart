import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      "Finance & Accounting",
      "Development",
      "Bussiness",
      "IT & Software",
      "Office Productivity"
    ];
    List<IconData> icon = [
      EvaIcons.browserOutline,
      EvaIcons.browserOutline,
      EvaIcons.browserOutline,
      EvaIcons.browserOutline,
      EvaIcons.browserOutline,
    ];
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon[0],
            color: Colors.grey,
          ),
          title: Text(
            list[0].toString(),
            style: TextStyle(color: Colors.grey),
          ),
        ),
        ListTile(
          leading: Icon(
            icon[1],
            color: Colors.grey,
          ),
          title: Text(
            list[1].toString(),
            style: TextStyle(color: Colors.grey),
          ),
        ),
        ListTile(
          leading: Icon(
            icon[2],
            color: Colors.grey,
          ),
          title: Text(
            list[2].toString(),
            style: TextStyle(color: Colors.grey),
          ),
        ),
        ListTile(
          leading: Icon(
            icon[3],
            color: Colors.grey,
          ),
          title: Text(
            list[3].toString(),
            style: TextStyle(color: Colors.grey),
          ),
        ),
        ListTile(
          leading: Icon(
            icon[4],
            color: Colors.grey,
          ),
          title: Text(
            list[4].toString(),
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}

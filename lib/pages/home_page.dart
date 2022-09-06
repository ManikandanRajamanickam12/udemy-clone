import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:udemyclone/pages/account.dart';
import 'package:udemyclone/pages/course.dart';
import 'package:udemyclone/pages/features.dart';
import 'package:udemyclone/pages/search.dart';
import 'package:udemyclone/pages/wishlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  int currentIndex = 0;

  void onTap(int page) {
    setState(() {
      currentIndex = page;
    });
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        scrollDirection: Axis.horizontal,
        controller: pageController,
        children: const [
          Featured(),
          Search(),
          MyCourses(),
          Wishlist(),
          Account()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        backgroundColor: Colors.grey.shade900,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: Colors.redAccent),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(color: Colors.white),
        iconSize: 26,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Feature"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.music_video), label: "My Courses"),
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.heartOutline), label: "Wishlist"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: "Account")
        ],
      ),
    );
  }
}

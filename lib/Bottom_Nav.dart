import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/Home.dart';
import 'package:food_delivery/pages/favorite.dart';
import 'package:food_delivery/pages/profile.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int i = 1;
  List<Widget> pages = [const FavoriteP(), const MyHomePage(), const ProfileP()];
  void selec(int index) {
    print("this index $index");
    setState(() {
      i = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(i);
    return Scaffold(
      body: pages[i],
      bottomNavigationBar: CurvedNavigationBar(
        index: i,
        items: const <Widget>[
          Icon(Icons.favorite, size: 35, color: Colors.black),
          Icon(Icons.home, size: 30, color: Colors.black),
          Icon(Icons.account_circle, size: 30, color: Colors.black),
        ],
        color: Colors.transparent, // Set the color to transparent
        buttonBackgroundColor: const Color(0xFFFF4E02),
        backgroundColor:
            Colors.transparent, // Set the background color to transparent
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),

        onTap: selec,
        //  letIndexChange: (index) => true,
      ),
    );
  }
}

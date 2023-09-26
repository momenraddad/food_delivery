import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
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
  List<Widget> pages = [
    const FavoriteP(),
    const MyHomePage(),
    const ProfileP()
  ];
  // late Color color2;

  void selec(int index) {
    print("this index $index");
    setState(() {
      i = index;
      // Color color2 = Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(i);
    return Scaffold(
      body: pages[i],
      bottomNavigationBar: Platform.isIOS
          ? CupertinoTabBar(
              currentIndex: i,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.heart_fill,
                    size: 35.0,
                    color:
                        i == 0 ? CupertinoColors.white : CupertinoColors.black,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.home,
                    size: 30.0,
                    color:
                        i == 1 ? CupertinoColors.white : CupertinoColors.black,
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.person_fill,
                    size: 30.0,
                    color:
                        i == 2 ? CupertinoColors.white : CupertinoColors.black,
                  ),
                ),
              ],
              onTap: (index) {
                setState(() {
                  i = index;
                });
              },
              backgroundColor: CupertinoColors.white,
            )
          : CurvedNavigationBar(
              index: i,
              items: <Widget>[
                Icon(Icons.favorite,
                    size: 35, color: i == 0 ? Colors.white : Colors.black),
                Icon(Icons.home,
                    size: 30, color: i == 1 ? Colors.white : Colors.black),
                Icon(Icons.account_circle,
                    size: 30, color: i == 2 ? Colors.white : Colors.black),
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

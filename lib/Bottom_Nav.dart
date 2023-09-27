import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/Home.dart';
import 'package:food_delivery/pages/favorite.dart';
import 'package:food_delivery/pages/profile.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class MyWidget extends StatefulWidget {
  MyWidget({super.key, this.indexs = 1});
  int? indexs;
  @override
  State<MyWidget> createState() => _MyWidgetState(indexs!);
}

class _MyWidgetState extends State<MyWidget> {
  _MyWidgetState(this.i);

  List<Widget> pages = [const FavoriteP(), MyHomePage(), const ProfileP()];
  // late Color color2;
  int i = 1;

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
      body: pages[i!],
      bottomNavigationBar: Platform.isIOS
          ? PersistentTabView(
              context,
              stateManagement: true,
              controller: PersistentTabController(initialIndex: i),
              screens: pages,
              // navBarStyle: NavBarStyle.style15,

              items: [
                PersistentBottomNavBarItem(
                  icon: Icon(Icons.favorite, size: 25),
                  title: "Favorite",
                  activeColorPrimary: Colors.deepOrange,
                  inactiveColorPrimary: Colors.black,
                ),
                PersistentBottomNavBarItem(
                  icon: Icon(Icons.home, size: 25),
                  title: "Home",
                  activeColorPrimary: Colors.deepOrange,
                  inactiveColorPrimary: Colors.black,
                ),
                PersistentBottomNavBarItem(
                  icon: Icon(Icons.account_circle, size: 25),
                  title: "Account",
                  activeColorPrimary: Colors.deepOrange,
                  inactiveColorPrimary: Colors.black,
                ),
              ],
              decoration: NavBarDecoration(
                colorBehindNavBar: Colors.transparent,
                borderRadius: BorderRadius.circular(10.0),
              ),
              // controllerPopAllScreensOnTapOfSelectedTab: true,
              popActionScreens: PopActionScreensType.once,
              navBarStyle: NavBarStyle.style1,
              screenTransitionAnimation: const ScreenTransitionAnimation(
                animateTabTransition: true,
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: 400),
              ),
              onItemSelected: (int index) {
                setState(() {
                  i = index;
                });
              },
            )
          : CurvedNavigationBar(
              index: i!,
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

import 'package:flutter/material.dart';
import 'package:food_delivery/pages/favorite.dart';
import 'package:food_delivery/pages/product_details.dart';
import 'Bottom_Nav.dart';
import 'itemes/fooditemes.dart';
import 'package:food_delivery/pages/Home.dart';
import 'package:food_delivery/pages/favorite.dart';
// import 'Bottom_Nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      // home:  MyWidget(),
      routes: {
        '/': (context) => MyWidget(),

        '/productH': (context) => DetalisF(
              Fooditem: itemes[x!]['itemes'][y],
              catag: itemes[x!]['type'],
              i: x,
              j: y,
              routesB: '/',
            ),
        '/productF': (context) => DetalisF(
            Fooditem: itemes[s[i1]['i']!]['itemes'][s[i1]['j']],
            catag: s[i1]['type'],
            i: s[i1]['i'],
            j: s[i1]['j'],
            routesB: '/favoriteP'),
        '/favoriteP': (context) => MyWidget(
              indexs: 0,
            )
        // Use the actual class, not 'const'.
      },
    );
  }
}

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/Myorder.dart';

class List_tile extends StatelessWidget {
  const List_tile({super.key, required this.leading, required this.title});
  final IconData leading;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? ListTile(
            leading: Icon(leading, color: Colors.black, size: 40),
            title: Text(
              title,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Text(
              "you can find  $title here ! ",
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
            onTap: () {},
          )
        : CupertinoListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Myorder()));
            },
            leading: Icon(leading, color: Colors.black, size: 40),
            title: Text(
              title,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Text(
              "you can find  $title here ! ",
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          );
  }
}

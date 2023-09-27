import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/itemes/myorder.dart';
import 'package:food_delivery/widgets/list_tile.dart';
import 'package:food_delivery/widgets/orders.dart';

class ProfileP extends StatelessWidget {
  const ProfileP({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(
                        "assets/images/226304155_3119511938371364_748348010614106855_n.jpg"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "momen raddad",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Software engineer",
                    style: TextStyle(
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Order_C(title: "Orders", value: myorder.length),
                      SizedBox(
                        width: 130,
                        height: 60,
                        child: VerticalDivider(),
                      ),
                      Order_C(title: "Coupons", value: 5)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    height: 0,
                  ),
                  if (!Platform.isAndroid) ...{
                    const List_tile(
                        leading: Icons.shopping_cart, title: "your order"),
                    const List_tile(
                        leading: Icons.card_giftcard, title: "your Coupons ")
                  } else ...{
                    CupertinoListSection(
                      children: const [
                        List_tile(
                            leading: Icons.shopping_cart, title: "your order"),
                        List_tile(
                            leading: Icons.card_giftcard,
                            title: "your Coupons ")
                      ],
                    )
                  }
                ]),
          ),
        ),
      ),
    );
  }
}

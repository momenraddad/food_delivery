import 'package:flutter/material.dart';

class appbar extends StatelessWidget {
  const appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      InkWell(
        onTap: () {},
        child: const DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            child: Icon(size: 30, Icons.menu)),
      ),
      Column(
        children: [
          Text(
            "current location",
            style: TextStyle(color: Colors.grey[500], fontSize: 12),
          ),
          const Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.green,
                size: 20,
              ),
              Text(
                " Nablus,palestine",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )
            ],
          )
        ],
      ),
      InkWell(
        onTap: () {},
        child: const DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            child: Icon(size: 30, Icons.notifications)),
      ),
    ]);
  }
}

import 'package:flutter/material.dart';

class Order_C extends StatelessWidget {
  const Order_C({
    super.key,
    required this.title,
    required this.value,
  });
  final int value;
  final title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          value.toString(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  Search({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            "https://www.shutterstock.com/shutterstock/photos/2316534265/display_1500/stock-photo--discount-offer-flyer-design-template-brochure-poster-caf-and-restaurant-menu-delicious-2316534265.jpg",
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
            width: double.infinity,
            height: size.width > 800 ? size.height * 0.5 : size.height * 0.22,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          width: double.infinity,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.grey[500],
                ),
                Text(" Find your food",
                    style: TextStyle(color: Colors.grey[500], fontSize: 15))
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

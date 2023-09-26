import 'package:flutter/material.dart';
import 'package:food_delivery/pages/product_details.dart';

import '../itemes/fooditemes.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;
    print(orientation);
    return SafeArea(
      child: Scaffold(
        //floating action button position to center

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 12),
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
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
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
                    ]),
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
                    height: size.width > 800
                        ? size.height * 0.5
                        : size.height * 0.22,
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
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 15))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                itemloop(
                  itemes: itemes,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class itemloop extends StatefulWidget {
  itemloop({super.key, required this.itemes});
  List? itemes;

  @override
  State<itemloop> createState() => _itemloopState(itemes: itemes);
}

class _itemloopState extends State<itemloop> {
  _itemloopState({required this.itemes});

  List? itemes;

  int click = 0;
  bool? state;
  // int click11;
  bool clickF = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (int i = 0; i < itemes!.length; i++) ...{
                InkWell(
                  onTap: () {
                    setState(() {
                      state = false;
                      click = i;
                      // index = -1;
                      // click == 5 ? click-- : click;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color:
                            click == i ? const Color(0xFFFF4E02) : Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    height: 90,
                    width: 75,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Image.asset(
                            itemes![i]['pic'].toString(),
                            fit: BoxFit.fill,
                            height: itemes![i]['type'].toString() != 'Burger'
                                ? size.height * 0.05
                                : size.height * 0.06,
                            width: itemes![i]['type'].toString() != 'Burger'
                                ? size.width * 0.1
                                : size.width * 0.12,
                            color: click != i ? Colors.black : Colors.white,
                          ),
                          SizedBox(
                            height: itemes![i]['type'].toString() != 'Burger'
                                ? 7
                                : 0,
                          ),
                          Text(
                            itemes![i]['type'].toString(),
                            style: TextStyle(
                              color: click == i ? Colors.white : Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                )
              },
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          child: GridView(
            // padding: EdgeInsets.all(10),
            shrinkWrap: true,
            reverse: false,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: size.width > 800 ? 4 : 2),
            children: <Widget>[
              if (itemes![click == 5 ? --click : click]['itemes'][0] !=
                  "null") ...{
                for (int j = 0; j < itemes![click]['count']; j++) ...{
                  LayoutBuilder(
                    builder: ((context, constraints) => Container(
                          width: 170,
                          height: 200,
                          color: Colors.white,
                          child: Stack(children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => DetalisF(
                                              Fooditem: itemes![click]['itemes']
                                                  [j],
                                              catag: itemes![click]['type'],
                                              i: click,
                                              j: j,
                                            ))));
                              },
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        itemes![click]['itemes'][j]['pic'],
                                        height: constraints.maxHeight * 0.5,
                                        width: constraints.maxWidth * 0.5,
                                        fit: BoxFit.contain),
                                    Text(
                                      itemes![click]['itemes'][j]['name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              constraints.maxHeight * 0.1),
                                    ),
                                    Text(itemes![click]['itemes'][j]['time'] +
                                        " Min | " +
                                        itemes![click]['itemes'][j]['sales'] +
                                        " Sell"),
                                    Text(
                                      "\$ " +
                                          itemes![click]['itemes'][j]['price'],
                                      style: const TextStyle(
                                          color: Color(0xFFFF4E02),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 7, // Adjust the top position as needed
                              right: 0, // Adjust the right position as needed
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      itemes![click]['itemes'][j]['state'] =
                                          !itemes![click]['itemes'][j]['state'];
                                    });
                                  },
                                  icon: itemes![click]['itemes'][j]['state'] ==
                                          false
                                      ? const Icon(Icons.favorite_border)
                                      : const Icon(Icons.favorite),
                                  color: Colors.deepOrange),
                            ),
                          ]),
                        )),
                  )
                }
              } else ...{
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Food of this category is not available yet ")
                  ],
                )
              }
            ],
          ),
        )
      ],
    );
  }
}

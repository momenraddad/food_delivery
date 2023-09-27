import 'package:flutter/material.dart';
import 'package:food_delivery/itemes/myorder.dart';
import '../itemes/fooditemes.dart';

class DetalisF extends StatefulWidget {
  DetalisF(
      {super.key,
      required this.Fooditem,
      required this.catag,
      required this.i,
      required this.j,
      this.routesB = '/'});
  final Fooditem;
  final catag;
  int? i;
  int? j;
  String routesB;

  @override
  State<DetalisF> createState() => _DetalisFState();
}

class _DetalisFState extends State<DetalisF> {
  int coun = 1;

  @override
  Widget build(BuildContext context) {
    print("this home page " + widget.Fooditem.toString());

    var price = double.parse(widget.Fooditem['price'].toString());
    price > 1 ? price.floor() : price;

    if (price != null) {
      price = price * coun;
    }
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          // Navigator.pop(context);
                          Navigator.popAndPushNamed(context, widget.routesB);
                        });
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          itemes[widget.i!]['itemes'][widget.j]['state'] =
                              !itemes[widget.i!]['itemes'][widget.j]['state'];
                          ;
                        });
                      },
                      splashRadius: 1,
                      icon: widget.Fooditem['state']
                          ? const Icon(Icons.favorite)
                          : const Icon(Icons.favorite_border),
                      color: Colors.deepOrange),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DecoratedBox(
                      decoration: const BoxDecoration(color: Color(0xFFFEFEFE)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          widget.Fooditem['pic'],
                          width: double.infinity,
                          height: 300,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      color: const Color(0xFFF5F5F5),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 7,
                              width: 70,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  widget.Fooditem['name'],
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Colors.black45,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        splashRadius: 1,
                                        onPressed: () {
                                          setState(() {
                                            coun == 1 ? coun : coun--;
                                          });
                                        },
                                        icon: const Icon(Icons.remove),
                                      ),
                                      Text(coun.toString(),
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w500)),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              coun++;
                                            });
                                          },
                                          icon: const Icon(Icons.add),
                                          splashRadius: 1,
                                          visualDensity: const VisualDensity(
                                              vertical: 0.5))
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const property_details(),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Description ,Description,Description,Description,Description,Description,Description,Description,Description,Description,Description,Description,Description, ",
                              softWrap: true,
                              style: TextStyle(
                                height: 2,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "\$ " + price.toString(),
                      style: const TextStyle(
                          fontSize: 30, color: Color(0xFFFF4E00)),
                    ),
                    const Spacer(),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        // color: Color(0xFFFF4E00),
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color(
                                  0xFFFF4E00), // Set the background color here
                            ),
                            onPressed: () {
                              setState(() {
                                myorder!.add({
                                  'itemes': itemes[widget.i!]['itemes']
                                      [widget.j],
                                  'value': coun,
                                  'priceT': price.toString()
                                });

                                print(myorder);
                              });
                            },
                            child: const Text(
                              "Checkout",
                              style: TextStyle(fontSize: 20),
                            )))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class property_details extends StatelessWidget {
  const property_details({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.s,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Size",
                    style: TextStyle(fontSize: 18, color: Colors.black54)),
                Text("Medium",
                    style: TextStyle(fontSize: 18, color: Colors.black))
              ],
            ),
            Container(
              color: Colors.white,
              width: 2,
              height: 50,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Calories",
                    style: TextStyle(fontSize: 18, color: Colors.black54)),
                Text("120",
                    style: TextStyle(fontSize: 18, color: Colors.black)),
              ],
            ),
            Container(
              color: Colors.white,
              width: 2,
              height: 50,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Cooking",
                    style: TextStyle(fontSize: 18, color: Colors.black54)),
                Text("5-10",
                    style: TextStyle(fontSize: 18, color: Colors.black)),
              ],
            )
          ],
        )
      ],
    );
  }
}

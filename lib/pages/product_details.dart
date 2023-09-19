import 'package:flutter/material.dart';
import '../itemes/fooditemes.dart';

class DetalisF extends StatefulWidget {
  DetalisF(
      {super.key,
      required this.Fooditem,
      required this.catag,
      required this.i,
      required this.j});
  final Fooditem;
  final catag;
  int? i;
  int? j;

  @override
  State<DetalisF> createState() => _DetalisFState();
}

class _DetalisFState extends State<DetalisF> {
  int coun = 1;

  @override
  Widget build(BuildContext context) {
    var price = double.parse(widget.Fooditem['price'].toString());
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
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  Spacer(),
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
                          ? Icon(Icons.favorite)
                          : Icon(Icons.favorite_border),
                      color: Colors.deepOrange),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(color: Color(0xFFFEFEFE)),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          widget.Fooditem['pic'],
                          width: double.infinity,
                          height: 300,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      color: Color(0xFFF5F5F5),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            SizedBox(
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
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  widget.Fooditem['name'],
                                  style: TextStyle(
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
                                        icon: Icon(Icons.remove),
                                      ),
                                      Text(coun.toString(),
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w500)),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              coun++;
                                            });
                                          },
                                          icon: Icon(Icons.add),
                                          splashRadius: 1,
                                          visualDensity:
                                              VisualDensity(vertical: 0.5))
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            property_details(),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
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
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "\$ " + price.floor().toString(),
                      style: TextStyle(fontSize: 30, color: Color(0xFFFF4E00)),
                    ),
                    Spacer(),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        // color: Color(0xFFFF4E00),
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(
                                  0xFFFF4E00), // Set the background color here
                            ),
                            onPressed: () {},
                            child: Text(
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
            Column(
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
            Column(
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
            Column(
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

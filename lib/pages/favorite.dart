import 'package:flutter/material.dart';

import '../itemes/fooditemes.dart';

int i1 = 0;

class FavoriteP extends StatefulWidget {
  const FavoriteP({super.key});

  @override
  State<FavoriteP> createState() => _FavoritePState();
}

class _FavoritePState extends State<FavoriteP> {
  int l = -1;

  int CC = 0;

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    counter = 0;
    s = [];

    int xa = check(itemes);
    print(xa);
    print(s);

    return xa != 0
        ? ListView.builder(
            itemBuilder: (context, index) {
              i1 = index;
              print("this index $index");
              print("this i1 $i1");
              print("this xa  $xa");
              return InkWell(
                onTap: () {
                  i1 = index;
                  print("this index 222 $index");

                  Navigator.pushNamed(context, '/productF');
                },
                child: Card(
                  elevation: 3,
                  margin: const EdgeInsets.all(3),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 100,
                            minHeight: 260,
                            maxWidth: 200,
                            maxHeight: 500,
                          ),
                          child: Image.asset(
                            itemes[s[index]['i']!]['itemes'][s[index]['j']]
                                ['pic'],
                            // height: 300,
                            // width: 190,
                            // fit: BoxFit.fill,
                          ),
                        ),
                        title: Text(itemes[s[index]['i']!]['itemes']
                                [s[index]['j']]['name']
                            .toString()),
                        subtitle: Text(
                            "${itemes[s[index]['i']!]['type']} - \$ ${itemes[s[index]['i']!]['itemes'][s[index]['j']]['price']}"),
                        trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                itemes[s[index]['i']!]['itemes'][s[index]['j']]
                                        ['state'] =
                                    !itemes[s[index]['i']!]['itemes']
                                        [s[index]['j']]['state'];
                              });
                            },
                            icon: const Icon(Icons.favorite),
                            color: Colors.deepOrange),
                      )),
                ),
              );
            },
            itemCount: xa,
          )
        : const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "No favorite items found",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          );
  }
}

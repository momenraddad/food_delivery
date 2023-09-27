import 'package:flutter/material.dart';

import '../itemes/myorder.dart';

class Myorder extends StatefulWidget {
  const Myorder({
    super.key,
  });
// final count;
// List myO;

  @override
  State<Myorder> createState() => _MyorderState();
}

class _MyorderState extends State<Myorder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
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
                    child: Image.asset(myorder[index]['itemes']['pic']
                        // height: 300,
                        // width: 190,
                        // fit: BoxFit.fill,
                        ),
                  ),
                  title: Text(myorder[index]['itemes']['name'].toString()),
                  subtitle: Text(
                      "${myorder[index]['itemes']['price']} *  ${myorder[index]['value']} = \$ ${myorder[index]['priceT']} "),
                  trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          myorder.removeAt(index);
                        });
                      },
                      icon: const Icon(Icons.remove),
                      color: Colors.deepOrange),
                )),
          );
        },
        itemCount: myorder.length,
      ),
    );
  }
}

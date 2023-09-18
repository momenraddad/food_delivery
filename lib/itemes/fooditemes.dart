List<Map<String, dynamic>> itemes = [
  {
    'pic': 'assets/images/burger.png',
    'type': 'Burger',
    'itemes': [
      {
        'pic': 'assets/images/beefB.jpg',
        'name': 'Beef Burger',
        'time': "30",
        'sales': "120",
        'price': "5.30",
        'state': false
      },
      {
        'pic': 'assets/images/MixedC.avif',
        'name': 'Mixed Cheese',
        'time': "20",
        'sales': "80",
        'price': "12.0",
        'state': false
      },
      {
        'pic': 'assets/images/beefB.jpg',
        'name': 'Beef Burger',
        'time': "30",
        'sales': "120",
        'price': "5.30",
        'state': false
      },
      {
        'pic': 'assets/images/MixedC.avif',
        'name': 'Mixed Cheese',
        'time': "20",
        'sales': "80",
        'price': "12.5",
        'state': false
      },
    ],
    'count': 4,
  },
  {
    'pic': 'assets/images/chi.png',
    'type': 'chicken',
    'itemes': [
      {
        'pic': 'assets/images/chiken.png',
        'name': 'chicken',
        'time': "15",
        'sales': "120",
        'price': "8.0",
        'state': false
      },
      {
        'pic': 'assets/images/crispy.png',
        'name': 'crispy',
        'time': "30",
        'sales': "50",
        'price': "4.2",
        'state': false
      }
    ],
    'count': 2
  },
  {
    'pic': 'assets/images/drink.png',
    'type': 'drinks',
    'itemes': [
      {
        'pic': 'assets/images/small cola  (Custom).jpeg',
        'name': 'Small cola',
        'time': "0",
        'sales': "150",
        'price': "0.5",
        'state': false
      },
      {
        'pic': 'assets/images/small pepsi.jpg',
        'name': 'Small pepsi',
        'time': "0",
        'sales': "120",
        'price': "0.3",
        'state': false
      },
      {
        'pic': 'assets/images/large cola.jpg',
        'name': 'Large pepsi',
        'time': "0",
        'sales': "55",
        'price': "1.0",
        'state': false
      },
      {
        'pic': 'assets/images/large pepsi.jpg',
        'name': 'Large pepsi',
        'time': "0",
        'sales': "80",
        'price': "0.8",
        'state': false
      },
    ],
    'count': 4
  },
  {
    'pic': 'assets/images/taco.png',
    'type': 'Taco',
    'itemes': ["null"],
    'count': 0
  },
];
List<Map<String, int>> s = [];

int check(List x) {
  int n = 0;
  for (int i = 0; i < x.length; i++) {
    for (int j = 0; j < x[i]['count']; j++) {
      if (x[i]['itemes'][j]['state'] == true) {
        s.add({'i': i, 'j': j});
        n++;
      }
    }
  }
  return n;
}

int x1 = check(itemes);

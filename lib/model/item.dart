import 'package:flutter/material.dart';

class Item {
  String id, title;
  double price;
  DateTime date;

  Item({
    required this.id,
    required this.title,
    required this.price,
    required this.date,
  });
}

class Items with ChangeNotifier {
  final List<Item> _items = [
    Item(id: '1', title: 'Item 1', price: 20, date: DateTime.now()),
    Item(id: '2', title: 'Item 2', price: 25, date: DateTime.now()),
    Item(id: '3', title: 'Item 3', price: 2000, date: DateTime.now()),
    Item(id: '4', title: 'Item 4', price: 2000, date: DateTime.now()),
  ];

  List<Item> get items => [..._items];

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    print('Provider ${_items.length}');
    notifyListeners();
  }

  void addItem(String title, double price, DateTime date) {
    _items.add(
      Item(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          date: date),
    );
    notifyListeners();
  }
}

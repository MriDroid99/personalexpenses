import 'package:flutter/material.dart';

// Models
import '../model/item.dart';

// Widgets
import '../widget/item_widget.dart';
import '../widget/sheet_widget.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  final List<Item> _items = [
    Item(id: '1', title: 'Item 1', price: 20, date: DateTime.now()),
    Item(id: '2', title: 'Item 2', price: 25, date: DateTime.now()),
    Item(id: '3', title: 'Item 3', price: 2000, date: DateTime.now()),
    Item(id: '4', title: 'Item 4', price: 2000, date: DateTime.now()),
  ];

  void _showSheet() {
    showModalBottomSheet(
        context: context, builder: (_) => SheetWidget(addItem));
  }

  void removeItem(String id) {
    setState(() {
      _items.removeWhere((item) => item.id == id);
    });
  }

  void addItem(String title, double price, DateTime date) {
    setState(() {
      _items.add(
        Item(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            date: date),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Items'),
      ),
      body: _items.length == 0
          ? Center(
              child: Image.asset('assets/waiting.png'),
            )
          : Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.separated(
                separatorBuilder: (_, i) => Divider(
                  thickness: 2,
                ),
                itemCount: _items.length,
                itemBuilder: (_, index) => ItemWidget(
                  _items[index].id,
                  _items[index].title,
                  _items[index].price,
                  _items[index].date,
                  removeItem,
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showSheet,
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

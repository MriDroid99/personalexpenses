import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Models
import '../model/item.dart';

// Widgets
import '../widget/item_widget.dart';
import '../widget/sheet_widget.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  // final List<Item> _items = [
  //   Item(id: '1', title: 'Item 1', price: 20, date: DateTime.now()),
  //   Item(id: '2', title: 'Item 2', price: 25, date: DateTime.now()),
  //   Item(id: '3', title: 'Item 3', price: 2000, date: DateTime.now()),
  //   Item(id: '4', title: 'Item 4', price: 2000, date: DateTime.now()),
  // ];

  void _showSheet() {
    showModalBottomSheet(context: context, builder: (_) => SheetWidget());
  }

  // void removeItem(String id) {
  //   setState(() {
  //     _items.removeWhere((item) => item.id == id);
  //   });
  // }

  // void addItem(String title, double price, DateTime date) {
  //   setState(() {
  //     _items.add(
  //       Item(
  //           id: DateTime.now().toString(),
  //           title: title,
  //           price: price,
  //           date: date),
  //     );
  //   });
  // }

  @override
  void initState() {
    print('InitState');
    super.initState();
  }

  @override
  void didUpdateWidget(covariant Screen oldWidget) {
    print('UpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('Dispose');
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    print('ChangeDep');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final List<Item> _items = Provider.of<Items>(context).items;
    print('Class ${_items.length}');
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

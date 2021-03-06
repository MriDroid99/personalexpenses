import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// Models
import '../model/item.dart';

class ItemWidget extends StatelessWidget {
  final String id, title;
  final double price;
  final DateTime date;
  const ItemWidget(
    this.id,
    this.title,
    this.price,
    this.date, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 5,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).accentColor,
            radius: 25,
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '\$$price',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          title: Text('$title'),
          subtitle: Text('${DateFormat.yMMMd().format(date)}'),
          trailing: IconButton(
            onPressed: () {
              Provider.of<Items>(context, listen: false).removeItem(id);
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

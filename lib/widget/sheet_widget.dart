import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SheetWidget extends StatefulWidget {
  final Function(String title, double price, DateTime date) addItem;
  SheetWidget(this.addItem, {Key? key}) : super(key: key);

  @override
  _SheetWidgetState createState() => _SheetWidgetState();
}

class _SheetWidgetState extends State<SheetWidget> {
  DateTime? _selectedDate;
  var _titleController = TextEditingController();
  var _priceController = TextEditingController();

  void _showDate(ctx) {
    showDatePicker(
      context: ctx,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((date) {
      setState(() {
        _selectedDate = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(
                labelText: 'Price',
              ),
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_selectedDate == null
                    ? 'Selected Date'
                    : '${DateFormat('yMMMMd').format(_selectedDate!)}'),
                TextButton(
                  onPressed: () => _showDate(context),
                  child: Text('Choose Date'),
                  style: TextButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                widget.addItem(_titleController.text,
                    double.parse(_priceController.text), _selectedDate!);
              },
              child: Text('Add Item'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor)),
            )
          ],
        ),
      ),
    );
  }
}

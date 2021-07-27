import 'package:flutter/material.dart';

// Screens
import 'screen/items_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.purple.shade100,
      ),
      home: ItemsScreen(),
    );
  }
}

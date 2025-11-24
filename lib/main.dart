import 'package:flutter/material.dart';
import "listview.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 222, 236),
        appBar: AppBar(
          title: Text(
            "Book community",
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 237, 190, 253),
        ),
        body: Listview(),

      ),
    );
  }
}

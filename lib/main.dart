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
       backgroundColor: const Color.fromARGB(255, 227, 194, 163),
        appBar: AppBar(
          title: Text(
            "The Reading Haven 📚✨",
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFF5F5DC),
        ),
         body: Listview(),

      ),
    );
  }
}

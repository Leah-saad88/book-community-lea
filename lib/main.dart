import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Book community",
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 232, 222, 222),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/leahedit.jpg"),
              fit: BoxFit.cover,
            ),
          ),

            child: Padding(
            padding: const EdgeInsets.only(top: 79),
              child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "welcome to our Book club",
                style: const TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(179, 12, 10, 10),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        
        ),
      ),
    );
  }
}

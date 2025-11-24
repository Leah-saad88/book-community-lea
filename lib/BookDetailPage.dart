

import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  final String title;
  final String category;
  final String image;
  final String description;
  const NewPage({
    super.key,
    required this.title,
    required this.category,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 221, 225, 228),
      ),
      body: Center(
        child: Column(
          children: [
            Text(category, style: TextStyle(fontSize: 24, color: Colors.black)),
            SizedBox(height: 20),
            Image.asset(image, width: 200, height: 200),
            Text(
              description,
              style: TextStyle(fontSize: 17 ,color: Colors.black12),
            )
          ],
        ),
      ),
    );
  }
}

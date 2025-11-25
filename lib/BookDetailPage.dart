import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  final String title;
  final String category;
  final String image;
  final String description;
  final double rating;

  const NewPage({
    super.key,
    required this.title,
    required this.category,
    required this.image,
    required this.description,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: const Color(0xFFF5F5DC),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/back.jfif"),
            fit: BoxFit.cover,
          ),
        ),

        child: Center(
          child: Column(
            children: [
              Text(
                category,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Image.asset(image, width: 200, height: 200),
              Text(
                description,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

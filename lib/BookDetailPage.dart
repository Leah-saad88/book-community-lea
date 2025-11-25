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
        title: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
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
              const SizedBox(height: 44),
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
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "⭐" * rating.floor(), // repeat emoji stars
                    style: const TextStyle(fontSize: 22),
                  ),
                  if (rating % 1 != 0)
                    const Text(
                      "⭐",
                      style: TextStyle(fontSize: 22),
                    ), // half star if needed
                  const SizedBox(width: 8),

                  Text(
                    rating.toString(), // show numeric rating like "4.7"
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

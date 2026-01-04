import 'package:flutter/material.dart';
import 'Books.dart';
import 'FavoritesPage.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "The Reading Haven 📚✨",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WelcomeScreen(), 
    );
  }
}
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/tt.jpg"), 
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                backgroundColor: Colors.blueAccent.withOpacity(0.8),
              ),
              child: const Text(
                "Enter the Shop",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("The Reading Haven 📚✨"),
        centerTitle: true,
        backgroundColor: const Color(0xFFF5F5DC),
      ),
      body: const BooksPage(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.favorite),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavoritesPage(userId: 0),
            ),
          );
        },
      ),
    );
  }
}
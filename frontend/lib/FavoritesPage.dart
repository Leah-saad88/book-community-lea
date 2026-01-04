import 'package:flutter/material.dart';
import 'Books.dart';
import 'Login.dart'; // keep your existing navigation
// favorites list is imported from Books.dart

class FavoritesPage extends StatefulWidget {
  final int userId;
  const FavoritesPage({super.key, required this.userId});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  double get total => favorites.fold<double>(
      0,
      (sum, item) =>
          sum + (item["price"] as double) * (item["quantity"] as int));

  void increment(Map<String, dynamic> item) {
    setState(() {
      item["quantity"]++;
    });
  }

  void decrement(Map<String, dynamic> item) {
    setState(() {
      if (item["quantity"] > 1) item["quantity"]--;
    });
  }

  void removeItem(int index) {
    setState(() {
      favorites.removeAt(index);
    });
  }

  void checkout() {
    // keeps your existing logic
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites ❤️"),
        backgroundColor: const Color(0xFFF5F5DC),
      ),
      body: favorites.isEmpty
          ? const Center(child: Text("No favorites yet ❤️"))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final item = favorites[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    height: 150, // bigger card
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Book image
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16)),
                          child: Image.asset(
                            item["image"],
                            width: 120,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Book info + controls
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item["title"],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "\$${item["price"]} x ${item["quantity"]} = \$${(item["price"] * item["quantity"]).toStringAsFixed(2)}",
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black87),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove_circle),
                                      onPressed: () => decrement(item),
                                    ),
                                    Text(
                                      item["quantity"].toString(),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add_circle),
                                      onPressed: () => increment(item),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                      onPressed: () => removeItem(index),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: favorites.isEmpty
          ? null
          : Container(
              padding: const EdgeInsets.all(16),
              color: Colors.grey[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total: \$${total.toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton.icon(
                    onPressed: checkout,
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text("Checkout"),
                  ),
                ],
              ),
            ),
    );
  }
}
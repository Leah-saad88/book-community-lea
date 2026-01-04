import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Books.dart';
import 'Signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final zipController = TextEditingController();

  bool isLoading = false;

  Future<void> loginAndCheckout() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        nameController.text.isEmpty ||
        addressController.text.isEmpty ||
        zipController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    if (favorites.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No items to checkout!")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse("http://10.0.2.2:5000/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": emailController.text,
          "password": passwordController.text,
          "name": nameController.text,
          "address": "${addressController.text}, ZIP: ${zipController.text}",
          "favorites": favorites,
        }),
      );

      setState(() {
        isLoading = false;
      });

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data["message"] ?? "Login successful!")),
        );

        
        emailController.clear();
        passwordController.clear();
        nameController.clear();
        addressController.clear();
        zipController.clear();
        favorites.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data["message"] ?? "Login failed")),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double total = favorites.fold<double>(
      0,
      (sum, item) =>
          sum + (item["price"] as double) * (item["quantity"] as int),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Login & Delivery Info")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Text(
                      "Login & Delivery Info",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(height: 20),

                    
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(height: 16),

                    
                    TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),

                    
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: "Full Name",
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 16),

                    
                    TextField(
                      controller: addressController,
                      decoration: const InputDecoration(
                        labelText: "Address",
                        prefixIcon: Icon(Icons.home),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Zip
                    TextField(
                      controller: zipController,
                      decoration: const InputDecoration(
                        labelText: "Zip Code",
                        prefixIcon: Icon(Icons.location_pin),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),

                    
                    Text(
                      "Total: \$${total.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),

                    
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : loginAndCheckout,
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text("Login & Place Order"),
                      ),
                    ),
                    const SizedBox(height: 12),

                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SignupPage()),
                            );
                          },
                          child: const Text("Sign Up"),
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
  }
}
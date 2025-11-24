import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class ListViewDemo extends StatefulWidget {
  const ListViewDemo({super.key});

  @override
  State<ListViewDemo> createState() => _ListViewDemoState();
}
class _ListViewDemoState extends State<ListViewDemo> {
  final List<Map<String, String>> data = [
    {
      "Title": "Fake skating",
      "category": "Teen Romance",
      "description": "11",
      "image": "assets/fk.jpg",
      "rating": 4.5,
    },
    {
      "Title":"Better than the movies",
      "category": "Romance/comedy",
      "description": "11",
      "image": "assets/mv.webp",
      "rating": 4.5,
    },
      {
      "Title":"Starry eyes",
      "category": "Romance/comedy",
      "description": "11",
      "image": "assets/st.jfif",
      "rating": 4.2,
    },

     {
      "Title":"Five survive",
      "category": "Thriller",
      "description": "11",
      "image": "assets/fs.jfif",
      "rating": 4.7,
    },
     {
      "Title":"Good girl's guide to murder",
      "category": "thriller",
      "description": "11",
      "image": "assets/fd.jpg" ,
      "rating": 4.7,
    },
     {
      "Title":"one of us is lying",
      "category": "thriller",
      "description": "11",
      "image": "assets/on.jfif",
      "rating": 4.8,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Demo'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(height: 10),
              SizedBox(
                width: 400,
                height: 80,
                child: Card(
                  color: Colors.brown,
                  child: ListTile(
                    title: Text(
                      data[index]["Title"]!,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      data[index]["SubTitle"]!,
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: Image.network(data[index]["Image"]!, width: 40),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewPage(
                            title: data[index]["Title"]!,
                            subtitle: data[index]["SubTitle"]!,
                            image: data[index]["Image"]!,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
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

                const SizedBox(height: 30),

                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

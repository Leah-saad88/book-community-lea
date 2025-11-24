import 'package:flutter/material.dart';
import 'BookDetailPage.dart';
import 'package:flutter/cupertino.dart';


class Listview extends StatefulWidget {
  const Listview({super.key});

  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  final List<Map<String, dynamic>> data = [
    {
      "Title": "Fake skating",
      "category": "Teen Romance",
      "description": "11",
      "image": "assets/fk.jpg",
      "rating": 4.5,
    },
    {
      "Title": "Better than the movies",
      "category": "Romance/comedy",
      "description": "",
      "image": "assets/mv.webp",
      "rating": 4.5,
    },
    {
      "Title": "Starry eyes",
      "category": "Romance/comedy",
      "description": "11",
      "image": "assets/st.jfif",
      "rating": 4.2,
    },

    {
      "Title": "Five survive",
      "category": "Thriller",
      "description": "11",
      "image": "assets/fs.jfif",
      "rating": 4.7,
    },
    {
      "Title": "Good girl's guide to murder",
      "category": "thriller",
      "description": "11",
      "image": "assets/fd.jpg",
      "rating": 4.7,
    },
    {
      "Title": "one of us is lying",
      "category": "thriller",
      "description": "11",
      "image": "assets/on.jfif",
      "rating": 4.8,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          itemCount: data.length,
          separatorBuilder: (_, __) => SizedBox(height: 12),
          itemBuilder: (context, index) {
            final current = data[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewPage(
                       title: data[index]["Title"]!,
                       category: data[index]["category"]!,
                        image: data[index]["image"]!,
                        description: data[index]["description"]!,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                            current['image']!, // fixed
                           width: 80,
                           height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              current['Title']!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 6),
                           
                          ],
                        ),
                      ),
                      Icon(
                        CupertinoIcons.chevron_forward,
                         color: Color(0xFF8E8E93),
                        size: 20,
                      ),
                      SizedBox(width: 6),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
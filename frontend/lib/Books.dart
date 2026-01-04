
import 'package:flutter/material.dart';
import 'BookDetailPage.dart';


final List<Map<String, dynamic>> favorites = [];

bool isFavorite(String title) =>
    favorites.any((b) => b["title"] == title);

void addFavorite({
  required String title,
  required String image,
  required double price,
}) {
  final exists = isFavorite(title);
  if (!exists) {
    favorites.add({
      "title": title,
      "image": image,
      "price": price,
      "gift": false,
      "quantity": 1,
    });
  }
}

void removeFavorite(String title) {
  favorites.removeWhere((b) => b["title"] == title);
}

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  final List<Map<String, dynamic>> data = [
    { 
      "Title": "Starry eyes",
      "category": "Romance/comedy",
      "description":
          "Starry Eyes is a young adult novel by Jenn Bennett about two former best friends, Zorie and Lennon, who are forced to work together after a disastrous glamping trip leaves them stranded in the wilderness. As they trek through the California countryside, they must confront secrets, past hurts, and their developing feelings for each other. The story is a contemporary romance that also incorporates adventure, humor, and exploration of complex family dynamics and personal grief.",
      "image": "assets/st.jfif",
      "rating": 4.2,
      "price": 11.75,
    },
    {
      "Title": "Five survive",
      "category": "Thriller",
      "description":
          "Five Survive is a young adult thriller by Holly Jackson about six friends on an RV road trip whose vehicle breaks down in a remote area, only to realize they are being targeted by a sniper. The group is trapped, with limited time and escalating tensions as they try to figure out who is being targeted and who among them can be trusted. The novel is a fast-paced story of survival, secrets, and psychological suspense.",
      "image": "assets/fs.jfif",
      "rating": 4.7,
      "price": 13.25,
    },
    {
      "Title": "Good girl's guide to murder",
      "category": "Thriller",
      "description":
          "A Good Girl's Guide to Murder is a YA mystery by Holly Jackson about a high schooler, Pippa Fitz-Amobi, who reopens a cold case for her final project. The case is about the 2014 murder of Andie Bell and the subsequent suicide of her boyfriend, Sal Singh. Pip is skeptical of the closed verdict and, with Sal's younger brother Ravi, starts digging into dark secrets the town wants to keep hidden, putting them in danger.",
      "image": "assets/fd.jpg",
      "rating": 4.7,
      "price": 12.50,
    },
    {
      "Title": "One of us is lying",
      "category": "Thriller",
      "description":
          "One of Us Is Lying is a young adult mystery about five high school students who are in detention when one of them, Simon, dies under suspicious circumstances. The remaining four students—Bronwyn, Addy, Nate, and Cooper—become suspects, as Simon was about to expose their secrets on his notorious gossip app. The story, available as both a bestselling novel by Karen M. McManus and a TV series, follows the investigation and the characters' attempts to uncover the truth while grappling with their own secrets.",
      "image": "assets/on.jfif",
      "rating": 4.8,
      "price": 14.00,
    },
    {
      "Title": "Lightlark",
      "category": "Thriller/Fantasy",
      "description":
          "Lightlark is a fantasy novel by Alex Aster about the rulers of six cursed realms who must compete in a deadly game called the Centennial to break their curses. Every hundred years, the island of Lightlark appears to host this tournament, where one ruler must die to potentially save the rest. The story follows Isla Crown, the ruler of the Wildlings, who has a secret: she has no powers, while the other rulers possess unique abilities. She must lie, cheat, and betray to survive, even as she navigates unexpected love and alliances.",
      "image": "assets/lt.jpg",
      "rating": 4.7,
      "price": 15.25,
    },
    {
      "Title": "The cruel prince",
      "category": "Thriller/Fantasy",
      "description":
          "The Cruel Prince is a young adult fantasy novel by Holly Black about a mortal girl named Jude who is taken to live in the treacherous High Court of Faerie after her parents are murdered. She strives for a place in the court, navigating deadly political intrigue and a contentious rivalry with Prince Cardan, the youngest and cruelest son of the High King. The story features themes of power, identity, and moral ambiguity within a world of beautiful but dangerous fey.",
      "image": "assets/cr.webp",
      "rating": 4.5,
      "price": 13.75,
    },
    {
      "Title": "Harry Potter",
      "category": "Thriller/Fantasy",
      "description":
          "Harry Potter is a young wizard with a lightning-shaped scar on his forehead, messy black hair, and bright green eyes. He is the orphaned protagonist of the book and film series, who discovers his magical heritage at age eleven and attends Hogwarts School of Witchcraft and Wizardry. There, he battles the dark wizard Lord Voldemort, who killed his parents and is responsible for his scar.",
      "image": "assets/hr.jpg",
      "rating": 4.7,
      "price": 16.00,
    },
    {
      "Title": "Better than the movies",
      "category": "Romance/comedy",
      "description":
          "Better Than the Movies is a young adult romance novel about Liz Buxbaum, a high school senior and hopeless romantic who enlists the help of her childhood enemy, Wes Bennett, to win over her crush, Michael. As Liz navigates senior year and her crush's attention, she starts to question her rom-com ideals and her feelings for Wes. The story also deals with Liz's grief over her late mother, a fellow rom-com enthusiast.",
      "image": "assets/mv.webp",
      "rating": 4.5,
      "price": 14.50,
    },
    {
      "Title": "Fake skating",
      "category": "Teen Romance",
      "description":
          "Fake Skating is a young adult novel by Lynn Painter that follows high schoolers Dani and Alec, who pretend to be a couple to achieve their goals. The plot involves Dani needing an extracurricular for her college application and Alec wanting to improve his image for NHL scouts, and their fake relationship leads to them confronting past hurts and developing real feelings for each other. The story is a sports romance set in a hockey-obsessed town, combining elements of childhood friends to lovers and fake dating tropes.",
      "image": "assets/fk.jpg",
      "rating": 4.5,
      "price": 12.99,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: data.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.51,
        ),
        itemBuilder: (context, index) {
          final current = data[index];
          return BookCard(
            title: current["Title"]!,
            category: current["category"]!,
            image: current["image"]!,
            rating: current["rating"]!,
            description: current["description"]!,
            price: current["price"]!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewPage(
                    title: current["Title"]!,
                    category: current["category"]!,
                    image: current["image"]!,
                    description: current["description"]!,
                   
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class BookCard extends StatefulWidget {
  final String title;
  final String category;
  final String image;
  final double rating;
  final String description;
  final double price;
  final VoidCallback? onTap;

  const BookCard({
    super.key,
    required this.title,
    required this.category,
    required this.image,
    required this.rating,
    required this.description,
    required this.price,
    this.onTap,
  });

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  bool _isFav = false;

  @override
  void initState() {
    super.initState();
    _isFav = isFavorite(widget.title);
  }

  void _addToFavorites() {
    addFavorite(
      title: widget.title,
      image: widget.image,
      price: widget.price,
    );
  }

  void _removeFromFavorites() {
    removeFavorite(widget.title);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap, // whole card → detail page
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  widget.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
            const SizedBox(height: 8),

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ),

            
            const SizedBox(height: 4),
            Text(
              widget.category,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF3A6EE8),
                fontWeight: FontWeight.w600,
              ),
            ),

           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                widget.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ),

            
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 18),
                const SizedBox(width: 4),
                Text(
                  widget.rating.toString(),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isFav = !_isFav;
                      if (_isFav) {
                        _addToFavorites();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "${widget.title} added to your favorites ❤️",
                            ),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      } else {
                        _removeFromFavorites();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "${widget.title} removed from your favorites 💔",
                            ),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      }
                    });
                  },
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 180),
                    transitionBuilder: (child, anim) =>
                        ScaleTransition(scale: anim, child: child),
                    child: _isFav
                        ? const Icon(
                            Icons.favorite,
                            key: ValueKey('fav'),
                            color: Colors.red,
                            size: 20,
                          )
                        : const Icon(
                            Icons.favorite_border,
                            key: ValueKey('unfav'),
                            color: Colors.red,
                            size: 20,
                          ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}



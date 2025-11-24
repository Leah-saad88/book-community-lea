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
      "description":
          "Fake Skating is a young adult novel by Lynn Painter that follows high schoolers Dani and Alec, who pretend to be a couple to achieve their goals. The plot involves Dani needing an extracurricular for her college application and Alec wanting to improve his image for NHL scouts, and their fake relationship leads to them confronting past hurts and developing real feelings for each other. The story is a sports romance set in a hockey-obsessed town, combining elements of childhood friends to lovers and fake dating tropes.",
      "image": "assets/fk.jpg",
      "rating": 4.5,
    },
    {
      "Title": "Better than the movies",
      "category": "Romance/comedy",
      "description":
          "Better Than the Movies is a young adult romance novel about Liz Buxbaum, a high school senior and hopeless romantic who enlists the help of her childhood enemy, Wes Bennett, to win over her crush, Michael. As Liz navigates senior year and her crush's attention, she starts to question her rom-com ideals and her feelings for Wes. The story also deals with Liz's grief over her late mother, a fellow rom-com enthusiast.",
      "image": "assets/mv.webp",
      "rating": 4.5,
    },
    {
      "Title": "Starry eyes",
      "category": "Romance/comedy",
      "description":
          "“Starry Eyes” is a young adult novel by Jenn Bennett about two former best friends, Zorie and Lennon, who are forced to work together after a disastrous glamping trip leaves them stranded in the wilderness. As they trek through the California countryside, they must confront secrets, past hurts, and their developing feelings for each other. The story is a contemporary romance that also incorporates adventure, humor, and exploration of complex family dynamics and personal grief.",
      "image": "assets/st.jfif",
      "rating": 4.2,
    },

    {
      "Title": "Five survive",
      "category": "Thriller",
      "description":
          "“Five Survive” is a young adult thriller by Holly Jackson about six friends on an RV road trip whose vehicle breaks down in a remote area, only to realize they are being targeted by a sniper. The group is trapped, with limited time and escalating tensions as they try to figure out who is being targeted and who among them can be trusted. The novel is a fast-paced story of survival, secrets, and psychological suspense.",
      "image": "assets/fs.jfif",
      "rating": 4.7,
    },
    {
      "Title": "Good girl's guide to murder",
      "category": "thriller",
      "description":
          "“A Good Girl's Guide to Murder” is a YA mystery by Holly Jackson about a high schooler, Pippa Fitz-Amobi, who reopens a cold case for her final project. The case is about the 2014 murder of Andie Bell and the subsequent suicide of her boyfriend, Sal Singh. Pip is skeptical of the closed verdict and, with Sal's younger brother Ravi, starts digging into dark secrets the town wants to keep hidden, putting them in danger.",
      "image": "assets/fd.jpg",
      "rating": 4.7,
    },
    {
      "Title": "one of us is lying",
      "category": "thriller",
      "description":
     "“One of Us Is Lying” is a young adult mystery about five high school students who are in detention when one of them, Simon, dies under suspicious circumstances. The remaining four students—Bronwyn, Addy, Nate, and Cooper—become suspects, as Simon was about to expose their secrets on his notorious gossip app. The story, available as both a bestselling novel by Karen M. McManus and a TV series, follows the investigation and the characters' attempts to uncover the truth while grappling with their own secrets.",
      "image": "assets/on.jfif",
      "rating": 4.8,
    },
    {
       
    "Title": "Lightlark",
    "category": "Thriller/Fantasy",
    "description": "Lightlark is a fantasy novel by Alex Aster about the rulers of six cursed realms who must compete in a deadly game called the Centennial to break their curses. Every hundred years, the island of Lightlark appears to host this tournament, where one ruler must die to potentially save the rest. The story follows Isla Crown, the ruler of the Wildlings, who has a secret: she has no powers, while the other rulers possess unique abilities. She must lie, cheat, and betray to survive, even as she navigates unexpected love and alliances.",
    "image": "assets/lt.jpg",
    "rating": 4.7,
  },
  {
     "Title": "The cruel prince ",
    "category": "Thriller/Fantasy ",
    "description": "“The Cruel Prince” is a young adult fantasy novel by Holly Black about a mortal girl named Jude who is taken to live in the treacherous High Court of Faerie after her parents are murdered. She strives for a place in the court, navigating deadly political intrigue and a contentious rivalry with Prince Cardan, the youngest and cruelest son of the High King. The story features themes of power, identity, and moral ambiguity within a world of beautiful but dangerous fey.",
    "image": "assets/cr.webp",
    "rating": 4.5,
  },
  {
     "Title": "Harry potter",
    "category": "Thriller/Fantasy ",
    "description": "“Harry Potter”  is a young wizard with a lightning-shaped scar on his forehead, messy black hair, and bright green eyes. He is the orphaned protagonist of the book and film series, who discovers his magical heritage at age eleven and attends Hogwarts School of Witchcraft and Wizardry. There, he battles the dark wizard Lord Voldemort, who killed his parents and is responsible for his scar.",
    "image": "assets/hr.jpg",
    "rating": 4.7

  }



  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 234, 188, 188),
          padding: EdgeInsets.all(12,), // outer padding so grid doesn't touch screen edges
          child: GridView.builder(
            itemCount: data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 9,
              mainAxisSpacing: 9,
              childAspectRatio: 0.75, 
            ),
            itemBuilder: (context, index) {
              final current = data[index];
              return GestureDetector(
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
                    padding: EdgeInsets.all(6), 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            current['image']!,
                            width: 70, 
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          current['Title']!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 2),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 2,
                          ), 
                          decoration: BoxDecoration(
                            color: Colors.blueAccent.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            current['category']!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 3),
                        Icon(
                          CupertinoIcons.chevron_forward,
                          color: Color(0xFF8E8E93),
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

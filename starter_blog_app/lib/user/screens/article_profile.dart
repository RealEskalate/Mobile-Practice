import 'dart:js';

import 'package:flutter/material.dart';
import 'package:start_project_blog_g2/screens/screens.dart';
import '../../article/screens/constants.dart';

class Article {
  const Article(
    @required this._image,
    @required this._title,
    @required this._subtitle,
  );

  final String _image;
  final String _title;
  final String _subtitle;

  String get getImage {
    return _image;
  }

  String get getTitle {
    return _title;
  }

  String get getSubtitle {
    return _subtitle;
  }
}

List<Article> articles = const [
  Article(
    "dsa.png",
    "DATA STRUCTURE AND ALGORIGHMS",
    "A data structure is a named location that can be used to store and organize data. And, an algorithm is a collection of steps to solve a particular problem. ",
  ),
  Article(
    "ai.jpeg",
    "ARTIFICIAL INTELLIGENCE",
    "Artificial intelligence is the simulation of human intelligence",
  ),
  Article(
    "bigdata.jpg",
    "BIG DATA",
    "Why Big data Needs Think Data",
  ),
  Article(
    "UX.jpeg",
    "UX DESIGN",
    "Step design sprint for ux beginner",
  )
];
articleTiles(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.8,
    child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
              height: 15,
            ),
        // shrinkWrap: true,
        // scrollDirection: Axis.vertical,
        itemCount: articles.length,
        itemBuilder: ((context, index) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: borderRadius,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.13,
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Image.asset(
                        'images/${articles[index].getImage}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              articles[index].getTitle,
                              softWrap: true,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color(0xFF366AED),
                              ),
                            ),
                            Text(articles[index].getSubtitle,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                )),
                            const SizedBox(height: 10),
                            Row(children: const [
                              Icon(Icons.schedule, size: 15),
                              SizedBox(width: 7),
                              Text("1 hr ago"),
                            ]),
                          ]),
                    ),
                  ),
                  PopupMenuButton(itemBuilder: (context) {
                    return [
                      PopupMenuItem<int>(
                        // onTap: () {
                        //   Navigator.push(context,
                        //       MaterialPageRoute(builder: (context) {
                        //     return LoginPage();
                        //   }));
                        //   print("here");
                        // },
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/editarticle');
                            },
                            child: Center(
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 46),
                                  child: Text("Edit article")),
                            )),
                      ),
                      PopupMenuItem<int>(
                        value: 0,
                        child: Text("Delete article"),
                      ),
                    ];
                  })
                ]))),
  );
}

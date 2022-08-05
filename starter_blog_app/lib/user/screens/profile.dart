import 'package:flutter/material.dart';
import 'article_profile.dart';
import 'constants.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0XFFF0F2FE),
          appBar: AppBar(
            backgroundColor: Color(0xFFF1F5FF),
            elevation: 0,
            leading: Icon(Icons.sort, color: Colors.black),
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Profile",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
                      ),
                    ),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Container(
                                  padding: EdgeInsets.all(6), // Border width
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: borderRadius,
                                    border: Border.all(),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: borderRadius,
                                    child: SizedBox.fromSize(
                                      size: Size.fromRadius(50),
                                      child: Image.asset('images/profile.jpeg',
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Text(
                                      "Stroustrup",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Text(
                                      "Computer Sientist",
                                      style: TextStyle(
                                          color: Color(0xFF366AED),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Text(
                                      "About me",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18),
                                    ),
                                    Icon(
                                      Icons.border_color,
                                      size: 15,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 13,
                                ),
                                Text(
                                    "I'm a software engineer and " +
                                        "Ux Designer at eskalate with a " +
                                        "passion woring with a team.",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ))
                              ],
                            ),
                          ],
                        )),
                    Column(
                      children: [
                        Container(
                            margin: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                      top: 30,
                                      right: 30,
                                      bottom: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "MY POSTS",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: const [
                                            Icon(Icons.grid_view),
                                            SizedBox(width: 20),
                                            Icon(Icons.toc),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  articleTiles(context)
                                ],
                              ),
                            )),
                      ],
                    )
                  ]),
            ),
          )),
    );
  }
}

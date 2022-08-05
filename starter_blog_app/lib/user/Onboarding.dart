import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Blog App",
          style: TextStyle(
            fontSize: 15,
            color: Colors.blueAccent,
          ),
        ),
        backgroundColor: Colors.grey[100],
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.grey[100],
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: 125,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: FittedBox(
                          child: Image.asset('images/Elon.jpg'),
                          fit: BoxFit.fill,
                        ))),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.025,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: 125,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: FittedBox(
                          child: Image.asset('images/VR.jpg'),
                          fit: BoxFit.fill,
                        )
                        // child: Container(child: Image.asset('images/VR.jpg')),
                        )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: 125,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: FittedBox(
                          child: Image.asset('images/trump1.jpg'),
                          fit: BoxFit.fill,
                        ))),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.025,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: 125,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: FittedBox(
                          child: Image.asset('images/sun_set.jpg'),
                          fit: BoxFit.fill,
                        ))),
              ],
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
            height: 250,
            width: 350,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(
                    'Read the article you\nwant instantly',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(
                    'You can read thousands of articles on Blog\n' +
                        'club, save them in the application and\n' +
                        'share them with your loved ones.',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  // child: SmoothPageIndicator(),
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: Colors.grey[300],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: Colors.grey[300],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: Colors.grey[300],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Align(
                      child: Container(
                        height: 10,
                        width: 20,
                        decoration: new BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                              new BorderRadius.all(Radius.elliptical(25, 25)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),

                    SizedBox(
                      height: 40,
                      width: 60,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          primary: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Icon(Icons.arrow_forward_outlined),
                      ),
                    ),

                    // IconButton(
                    //   color: Colors.blue,
                    //   icon: const Icon(Icons.arrow_forward_outlined),
                    //   onPressed: (() {}),
                    // ),
                  ],
                ),
              ],
            ),
          ),
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.39,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.only(
          //         topRight: Radius.circular(20.0),
          //         topLeft: Radius.circular(20.0)),
          //     color: Colors.white,
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.grey,
          //         offset: Offset(0.0, 1.0), //(x,y)
          //         blurRadius: 1.5,
          //       ),
          //     ],
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.fromLTRB(70, 10, 80, 10),
          //     child: Text(
          //       "Read the article you \nwant instantly",
          //       style: TextStyle(
          //         fontSize: 25,
          //         fontWeight: FontWeight.w800,
          //       ),
          //     ),
          //   ),
          // )
        ]),
      ),
    );
  }
}

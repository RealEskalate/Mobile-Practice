import 'package:flutter/material.dart';

class MyDrawerHeader extends StatefulWidget {
  const MyDrawerHeader({key});

  @override
  State<MyDrawerHeader> createState() => _MyDrawerHeaderState();
}

class _MyDrawerHeaderState extends State<MyDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 270,
      // padding: EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 33.0, left: 29, right: 155),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white
              ),
            ),
            child:  Container(
              constraints: BoxConstraints.expand(width: 80, height: 80),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("image/profile.jpg")),
                shape: BoxShape.circle
              ),

              child: Container(
                margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                shape: BoxShape.circle


              ),
              ),
              
              )
            
          ),
          Container(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "John Doe",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "UI/UX Designer",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "eyobzebene3580@gmail.com",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            // padding: EdgeInsets.only(top: 10.0),
          ),
        ],
      ),
    );
  }
}

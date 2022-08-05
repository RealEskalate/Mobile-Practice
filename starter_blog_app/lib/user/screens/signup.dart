import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  static const routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Blog App",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.blue,
          ),
        ),
        backgroundColor: const Color(0xFFE5E5E5),
      ),
      body: Container(
        width: screen.width,
        height: screen.height,
        color: const Color(0xFFE5E5E5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 30),
              child: const Text(
                "Sign up",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 80),
              width: screen.width / 2,
              child: const FittedBox(
                fit: BoxFit.contain,
                child: Center(
                  child: Text(
                    "Enter your email address and password\nand start discovering",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  width: screen.width / 2,
                  height: screen.height * 0.058,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                      labelText: 'Full name',
                      // hintText: 'Enter full name',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: screen.width / 2,
                  height: screen.height * 0.058,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                      labelText: 'Email',
                      // hintText: 'Enter your email',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: screen.width / 2,
                  height: screen.height * 0.058,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                      labelText: 'Password',
                      // hintText: 'Enter your password',
                    ),
                  ),
                ),
                SizedBox(
                  width: screen.width * 0.65,
                  height: screen.height / 9,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: const Text(
                    "OR SIGNUP WITH",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  color: const Color(0xFFE5E5E5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 30),
                        color: const Color(0xFFE5E5E5),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: const Color(0xFFE5E5E5),
                          child: Center(
                            child: Column(
                              children: [
                                Image.network(
                                  "https://pbs.twimg.com/profile_images/1455185376876826625/s1AjSxph_400x400.jpg",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 30),
                        color: const Color(0xFFE5E5E5),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Center(
                            child: Column(
                              children: [
                                Image.network(
                                    "https://upload.wikimedia.org/wikipedia/en/thumb/0/04/Facebook_f_logo_%282021%29.svg/1200px-Facebook_f_logo_%282021%29.svg.png"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 30),
                        color: const Color(0xFFE5E5E5),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Center(
                            child: Column(
                              children: [
                                Image.network(
                                  "https://www.danoneinstitute.org/wp-content/uploads/2020/06/logo-rond-twitter.png",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Do you have an account? ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed('');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

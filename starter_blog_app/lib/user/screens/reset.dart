import 'package:flutter/material.dart';

class Reset extends StatelessWidget {
  static const routeName = 'reset';

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Blog App",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w400,
            fontSize: 15,
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
                "Fotgot Password",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Container(
              width: screen.width / 2,
              height: screen.height * 0.06,
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
            SizedBox(
              width: screen.width - 470,
              height: screen.height * 0.11,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 50),
              child: InkWell(
                child: const Text(
                  "Back to Log in",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

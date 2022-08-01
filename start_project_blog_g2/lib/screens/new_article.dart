import 'package:flutter/material.dart';

class NewArticlePage extends StatefulWidget {
  const NewArticlePage({Key? key, required this.title}) : super(key: key);
  final String title;
  static const String rounteName = "/newarticle";

  @override
  State<NewArticlePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NewArticlePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.fromLTRB(40, 40, 40, 0), children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "New Article",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Add title field
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Add title"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),

                  // Add subtitle field
                  TextFormField(
                    decoration: const InputDecoration(hintText: "Add subtitle"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),

                  // Add tags field
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // add tags field
                      Container(
                        width: 190,
                        child: TextFormField(
                          decoration:
                              const InputDecoration(hintText: "Add tags"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),

                      // add icon for adding tags. the onPressed function is to be done soon.
                      RawMaterialButton(
                        onPressed: () {},
                        elevation: 2.0,
                        fillColor: Colors.white,
                        child: Icon(
                          Icons.add,
                          size: 25.0,
                        ),
                        padding: EdgeInsets.all(0),
                        shape: const CircleBorder(),
                      ),
                    ],
                  ),
                  Text(
                    "add as many tags as you want.",
                  ),

                  Chip(
                      side: BorderSide(color: Colors.blue, width: 2),
                      backgroundColor: Colors.white,
                      label: const Text('Aaron Burr'),
                      deleteIcon: Icon(
                        Icons.close,
                      ),
                      onDeleted: () {
                        setState(() {});
                      }),

                  Container(),

                  // Article content
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: TextFormField(
                      maxLines: 15,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Article content',
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  // Cut, image, video, pdf, links, Texts Icons
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Center(
                      child: Container(
                        width: 220,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xff376AED),
                            borderRadius: BorderRadius.all(Radius.circular(200)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ]
                          ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 0.01,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(200))),
                              child: Icon(
                                Icons.close,
                                size: 40,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.broken_image_outlined,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.play_circle_outline_outlined,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.format_align_left_sharp,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.link_sharp,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.text_fields_outlined,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),

                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  // publish button
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color(0xff376AED)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        child: const Text('Publish'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

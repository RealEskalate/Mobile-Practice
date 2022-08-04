import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewArticlePage extends StatefulWidget {
  const NewArticlePage({Key? key, required this.title}) : super(key: key);
  final String title;
  static const String rounteName = "/newarticle";

  @override
  State<NewArticlePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NewArticlePage> {
  final _formKey = GlobalKey<FormState>();
  final tagController = TextEditingController();
  double h = 1;

  final listOfTags = [];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // header text
              const Text(
                "New Article",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              // The form
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
                      decoration:
                          const InputDecoration(hintText: "Add subtitle"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    // Add tags field and add icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // add tags field
                        Container(
                          width: width - 170,
                          child: TextFormField(
                            controller: tagController,
                            decoration:
                                const InputDecoration(hintText: "Add tags"),
                          ),
                        ),

                        // add icon for adding tags.
                        RawMaterialButton(
                          onPressed: () {
                            String newTagValue = tagController.text;
                            if (newTagValue.isNotEmpty &
                                !listOfTags.contains(newTagValue) &
                                (newTagValue.length <= 11)) {
                              listOfTags.add(newTagValue);
                              if (listOfTags.length % 2 == 1) {
                                h += 0.5;
                              }
                              setState(() {});
                            }
                          },
                          elevation: 2.0,
                          fillColor: Colors.white,
                          hoverColor: Colors.black12,
                          child: Icon(Icons.add_circle_outline_outlined,
                              color: Color(0xff376AED)),
                          shape: const CircleBorder(),
                        ),
                      ],
                    ),
                    Text(
                      "add as many tags as you want.",
                    ),
                    // Display the tags
                    SizedBox(height: height * (0.1 * h), child: buildTags()),
                    // Article content
                    TextFormField(
                      maxLines: 12,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Article content',
                      ),
                    ),
                    // Close, image, video, pdf, links, Texts Icons
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        width: width * 0.8 - 80,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xff376AED),
                            borderRadius:
                                BorderRadius.all(Radius.circular(200)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 0.01,
                            ),
                            // close icon
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(200))),
                              child: Icon(
                                Icons.close,
                                size: 40,
                                color: Colors.black,
                              ),
                            ),
                            // add photo icon
                            IconButton(
                              onPressed: (() {
                                getImage();
                                print("working");
                              }),
                              icon: Icon(
                                Icons.broken_image_outlined,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                            // add video icon
                            Container(
                              child: Icon(
                                Icons.play_circle_outline_outlined,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                            // add texts icon
                            Container(
                              child: Icon(
                                Icons.format_align_left_sharp,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                            // add links icon
                            Container(
                              child: Icon(
                                Icons.link_sharp,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                            // add texts icon
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

                    // publish button
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff376AED)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            )),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
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
        ),
      ),
    );
  }

  Widget buildTags() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: 3.5,
      ),
      scrollDirection: Axis.vertical,
      itemCount: listOfTags.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Chip(
                side: BorderSide(color: Color(0xff376AED), width: 2),
                backgroundColor: Colors.white,
                label: Text(listOfTags[index]),
                deleteIcon: Container(
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(200))),
                  child: Icon(
                    Icons.close,
                  ),
                ),
                onDeleted: () {
                  listOfTags.remove(listOfTags[index]);
                  h -= 0.25;
                  setState(() {});
                }),
          ],
        );
      },
    );
  }

  /// Get from gallery

  final imagePicker = ImagePicker();
  late File imageFile;

  Future getImage() async {
    var image = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      imageFile = File(image!.path);
    });
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_tags/flutter_tags.dart';

class NewArticlePage extends StatefulWidget {
  const NewArticlePage({Key? key}) : super(key: key);

  @override
  State<NewArticlePage> createState() => _NewArticlePageState();
}

class _NewArticlePageState extends State<NewArticlePage> {
  final _items = [];
  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: 300,
        child: ListView(
          children: [
            const Text(
              "New Article",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            const TextField(
                decoration: InputDecoration(
              hintText: 'Add Title ',
            )),
            const TextField(
                decoration: InputDecoration(
              hintText: 'Add Subtitle ',
            )),
            // ignore: prefer_const_literals_to_create_immutables

            Tags(
              key: _tagStateKey,
              textField: TagsTextField(
                textStyle: const TextStyle(fontSize: 18),

                //width: double.infinity, padding: EdgeInsets.symmetric(horizontal: 10),
                onSubmitted: (String str) {
                  // Add item to the data source.
                  setState(() {
                    // required
                    _items.add(Item(
                      title: str,
                      active: true,
                      index: 1,
                    ));
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Tags(
              itemCount: _items.length, // required
              itemBuilder: (int index) {
                final item = _items[index];

                return ItemTags(
                  // Each ItemTags must contain a Key. Keys allow Flutter to
                  // uniquely identify widgets.
                  key: Key(index.toString()),
                  index: index, // required
                  title: item.title,
                  active: item.active,
                  activeColor: Colors.white,
                  textActiveColor: Colors.black,

                  customData: item.customData,
                  textStyle: const TextStyle(
                    fontSize: 12,
                  ),
                  combine: ItemTagsCombine.withTextBefore,
                  // OR null
                  //,

                  removeButton: ItemTagsRemoveButton(
                    color: Color.fromARGB(255, 15, 55, 217),
                    backgroundColor: Color.fromARGB(255, 186, 211, 247),
                    onRemoved: () {
                      // Remove the item from the data source.
                      setState(() {
                        // required
                        _items.removeAt(index);
                      });
                      //required
                      return true;
                    },
                  ), // OR null,
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: const InputDecoration(
                    hintText: "Enter Remarks",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey)))),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF376AED)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(
                      Icons.cancel,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.image_outlined,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.play_circle_outline,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.list_outlined,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.attach_file_outlined,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.text_fields_outlined,
                      color: Colors.white,
                    )
                  ]),
            ),
            const SizedBox(
              height: 30,
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF376AED)),
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Publish",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    ));
  }
}

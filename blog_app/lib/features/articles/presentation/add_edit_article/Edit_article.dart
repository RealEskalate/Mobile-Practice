import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/add_edit/New_articles_bloc.dart';
import '../../bloc/add_edit/New_articles_event.dart';
import '../../bloc/add_edit/New_articles_state.dart';
import '../../widgets/custom_icons_icons.dart';

const Color primaryColor = Color(0xFF376AED);
const Color secondaryColor = Color(0xffdce5fc);

Widget editArticle = const Align(
  alignment: Alignment.centerLeft,
  child: Padding(
      padding: EdgeInsets.only(top: 58, left: 40, bottom: 15),
      child: Text(
        "Edit Article",
        style: TextStyle(fontSize: 24),
      )),
);

Widget hintText = Container(
  margin: const EdgeInsets.only(left: 40, bottom: 8),
  child: const Align(
      alignment: Alignment.bottomLeft,
      child: Text('add as many tags as you want',
          style: TextStyle(
              color: Color(0xFF979EA5), fontSize: 11, fontFamily: 'poppins'))),
);

class TagsChips extends StatefulWidget {
  const TagsChips({Key? key}) : super(key: key);

  @override
  State<TagsChips> createState() => Tags_ChipsState();
}

class Tags_ChipsState extends State<TagsChips> {
  List<String> _tags = ["Production", "Design", "Culture", "Art"];
  final TextEditingController _controller = TextEditingController();
  void addTag() {
    setState(() {
      _tags.add("${_controller.text}");
      _controller.text = "";
    });
  }

  Iterable<Widget> get actorWidgets {
    return _tags.map((String tag) {
      return Chip(
        deleteIcon: const CircleAvatar(
            backgroundColor: secondaryColor,
            child: Center(
              child: Icon(
                Icons.close_rounded,
                color: primaryColor,
                size: 16,
              ),
            )),
        label: Text(
          tag,
          style: const TextStyle(color: primaryColor),
        ),
        backgroundColor: Colors.white,
        shape: const StadiumBorder(
            side: BorderSide(width: 2, color: primaryColor)),
        onDeleted: () {
          setState(() {
            _tags.remove(tag);
          });
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: "Add tag"))),
              Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.add_circle_outline_outlined,
                      color: primaryColor,
                      size: 28,
                    ),
                    onPressed: addTag,
                  )),
            ],
          ),
        ),
        hintText,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Wrap(
            spacing: 16,
            runSpacing: 4,
            children: actorWidgets.toList(),
          ),
        ),
      ],
    );
  }
}

Widget attachments = Container(
  padding: const EdgeInsets.only(top: 4, bottom: 4, right: 16),
  margin: const EdgeInsets.symmetric(horizontal: 74),
  decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(100)),
    color: primaryColor,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 2),
      ),
    ],
  ),
  child: Row(
    children: const [
      Padding(
        padding: EdgeInsets.only(left: 4, right: 4),
        child: CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white,
            child: Center(
              child: Icon(
                Icons.close,
                color: Colors.black,
              ),
            )),
      ),
      Expanded(
        child: Icon(
          Icons.image,
          color: Colors.white,
          size: 24,
        ),
      ),
      Expanded(
        child: Icon(
          Icons.play_circle,
          color: Colors.white,
          size: 24,
        ),
      ),
      Expanded(
        child: Icon(
          Icons.content_paste,
          color: Colors.white,
          size: 24,
        ),
      ),
      Expanded(
        child: Icon(
          Icons.attachment,
          color: Colors.white,
          size: 24,
        ),
      ),
      Expanded(
        child: Icon(
          Icons.text_fields,
          color: Colors.white,
          size: 24,
        ),
      ),
    ],
  ),
);

Widget publicButton = Padding(
  padding: const EdgeInsets.only(top: 15, bottom: 57),
  child: ElevatedButton(
      onPressed: null,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          )),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Text(
          "publish",
          style: TextStyle(color: Colors.white),
        ),
      )),
);

class EditArticle extends StatefulWidget {
  const EditArticle({Key? key}) : super(key: key);

  @override
  State<EditArticle> createState() => _EditArticleState();
}

class _EditArticleState extends State<EditArticle> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesBloc, ArticlesState>(
      builder: (context, state) {
        if (state is EditArticleInitial) {
          context.read<ArticlesBloc>().add(GetArticlesEvent());
        } else if (state is FetchingArticle) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FetchingSuccess) {
          return buildArticle("state.article.title", "state.article.subtitle",
              "state.article.description");
        } else if (state is FetchingFailure) {
          return const Center(
            child: Text("failed to fetch data"),
          );
        } else if (state is UpdatingArticle) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UpdateSuccesful) {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //                         const SnackBar(
          //                             content: Text('Update Successfull.')));
          return const Center(
            child: Text(
              "Update succesful :)",
              style: TextStyle(fontSize: 30),
            ),
          );
        } else if (state is UpdateFailed) {
          return const Center(
            child: Text(
              "Update failed :(",
              style: TextStyle(fontSize: 30),
            ),
          );
        }
        ;
        // { ScaffoldMessenger.of(context).showSnackBar(
        //                         const SnackBar(
        //                             content: Text('Updating Failed')),

        return const Text("something went wrong");
      },
    );
  }
}

class EditArticlePage extends StatelessWidget {
  const EditArticlePage({key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'my app',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ArticlesBloc(),
        child: const EditArticle(),
      ),
    );
  }
}

Widget buildArticle(String title, String subtitle, String description) {
  final titlecontroler = TextEditingController(text: title);
  final subtitlecontroler = TextEditingController(text: subtitle);
  final discriptioncontroler = TextEditingController(text: description);
  // discriptioncontroler.text = description;
  return BlocBuilder<ArticlesBloc, ArticlesState>(
    builder: (context, state) {
      return SingleChildScrollView(
        child: Column(
          children: [
            editArticle,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
              child: TextFormField(
                // initialValue: title,
                controller: titlecontroler,
                decoration: InputDecoration(hintText: "Add title"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
              child: TextFormField(
                // initialValue: subtitle,
                controller: subtitlecontroler,
                decoration: InputDecoration(hintText: "Add subtitles"),
              ),
            ),
            // taglist,
            const TagsChips(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
              child: TextField(
                controller: discriptioncontroler,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Article content',
                    alignLabelWithHint: true),
                keyboardType: TextInputType.multiline,
                minLines: 10,
                maxLines: 50,
              ),
            ),
            attachments,
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<ArticlesBloc>().add(UpdateArticleEvent(
                    titlecontroler.text,
                    subtitlecontroler.text,
                    discriptioncontroler.text));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  )),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  "publish",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );
    },
  );
  // return SingleChildScrollView(
  //   child: Column(
  //     children: [
  //       editArticle,
  //       TextFieldWidget(
  //         value: title,
  //         hint: "Add title",
  //       ),
  //       TextFieldWidget(
  //         value: subtitle,
  //         hint: "Add subtitle",
  //       ),
  //       // taglist,
  //       const TagsChips(),
  //       DescriptionBox(value: description),
  //       attachments,
  //       publicButton
  //     ],
  //   ),
  // );
}

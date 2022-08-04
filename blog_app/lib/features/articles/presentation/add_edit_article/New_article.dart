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

Widget newArticle = const Align(
  alignment: Alignment.centerLeft,
  child: Padding(
      padding: EdgeInsets.only(top: 58, left: 40, bottom: 15),
      child: Text(
        "New Article",
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
  List<String> _tags = [];
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
          CustomIcons.image,
          color: Colors.white,
          size: 24,
        ),
      ),
      Expanded(
        child: Icon(
          CustomIcons.play,
          color: Colors.white,
          size: 24,
        ),
      ),
      Expanded(
        child: Icon(
          CustomIcons.align,
          color: Colors.white,
          size: 24,
        ),
      ),
      Expanded(
        child: Icon(
          CustomIcons.link,
          color: Colors.white,
          size: 24,
        ),
      ),
      Expanded(
        child: Icon(
          CustomIcons.scale,
          color: Colors.white,
          size: 24,
        ),
      ),
    ],
  ),
);

Widget publicButton = Padding(
  padding: const EdgeInsets.only(top: 15, bottom: 57),
  child: BlocBuilder<ArticlesBloc, ArticlesState>(
    builder: (context, state) {
      return ElevatedButton(
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
          ));
    },
  ),
);

class NewArticle extends StatefulWidget {
  static const String routeName = "addArticle";

  const NewArticle({Key? key}) : super(key: key);

  @override
  State<NewArticle> createState() => _NewArticleState();
}

class _NewArticleState extends State<NewArticle> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticlesBloc, ArticlesState>(
      builder: (context, state) {
        if (state is EditArticleInitial) {
          return buildArticle();
        } else if (state is PublishSuccesful) {
          return const Center(
            child: Text(
              "Publish successful :)",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          );
        } else if (state is PublishFailed) {
          return const Center(
              child: Text("Publish Failed :(", style: TextStyle(fontSize: 30)));
        } else
          return Text("something went wrong :(");
      },
    );
  }
}

class NewArticlePage extends StatelessWidget {
  const NewArticlePage({key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'my app',
      home: AddArticlePage(),
    );
  }
}

class AddArticlePage extends StatefulWidget {
  static const String routeName = "addArticlePage";
  const AddArticlePage({Key? key}) : super(key: key);

  @override
  State<AddArticlePage> createState() => _AddArticlePageState();
}

class _AddArticlePageState extends State<AddArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ArticlesBloc(),
        child: const NewArticle(),
      ),
    );
  }
}

Widget buildArticle() {
  final titlecontroler = TextEditingController();
  final subtitlecontroler = TextEditingController();
  final discriptioncontroler = TextEditingController();
  return BlocBuilder<ArticlesBloc, ArticlesState>(
    builder: (context, state) {
      return SingleChildScrollView(
        child: Column(
          children: [
            newArticle,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
              child: TextFormField(
                controller: titlecontroler,
                decoration: InputDecoration(hintText: "Add title"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
              child: TextFormField(
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
                context.read<ArticlesBloc>().add(PublishArticleEvent(
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
}

class TextFieldWidget extends StatelessWidget {
  String value;
  String hint;
  TextFieldWidget({Key? key, required this.value, required this.hint})
      : super(key: key);
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _controller.text = value;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
      child: TextField(
          controller: _controller,
          decoration: InputDecoration(
              border: const UnderlineInputBorder(), hintText: hint)),
    );
  }
}

class DescriptionBox extends StatelessWidget {
  String value;
  final TextEditingController _controller = TextEditingController();
  DescriptionBox({Key? key, required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _controller.text = value;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: TextField(
        controller: _controller,
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
    );
  }
}

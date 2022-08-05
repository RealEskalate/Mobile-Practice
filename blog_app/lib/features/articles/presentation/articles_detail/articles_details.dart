import 'package:blog_app/features/articles/bloc/article_detail/article_detail_bloc.dart';
import 'package:blog_app/features/articles/utils/styles.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../bloc/comment/comment_bloc.dart';
import '../../bloc/comment/comment_event.dart';
import '../../bloc/comment/comment_state.dart';
import '../../bloc/filter/filter_bloc.dart';
import '../../data_provider/mockArticleDetail.dart';
import '../../models/article.dart';
import '../../models/comment.dart';

class ArticleDetail extends StatefulWidget {
  static const String routeName = "ArticleDetail";
  final Article article;
  const ArticleDetail({Key? key, required this.article}) : super(key: key);

  @override
  State<ArticleDetail> createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  @override
  void initState() {
    BlocProvider.of<ArticleDetailBloc>(context).add(GetArticle(widget.article));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return _buildArticle(context);
    return BlocBuilder<ArticleDetailBloc, ArticleDetailState>(
      builder: (context, state) {
        if (state is ArticleDetailInitial) {
          return _buildLoading();
        } else if (state is ArticleSuccessState) {
          return _buildArticle(context, state.article);
        } else if (state is ArticleErrorState) {
          return _buildError(context, state.error);
        } else {
          return Container();
        }
      },
    );
  }
}

Widget _buildArticle(BuildContext context, Article article) {
  final cardColor = const Color(0xF6F6F6);
  final myController = TextEditingController();
  var username = article.authorName;
  String postedDate = article.createdAt.toString();
  String title = article.title;
  String image = article.imageUrl;
  String content = article.description;
  // "The number of daily active Facebook users grew to 1.96 billion. That marked a turnaround from last year, when the social network reported a decline in users for the first time.\n\nThe drop wiped billions from the firm's market value.\n\nSince executives disclosed the fall in February, the firm's share price has nearly halved. But shares jumped 19% in after-hours trade on Wednesday.";
  List<Comment> comments = MockComment().comments;
  Widget CommentCard(comment) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Card(
        // color: cardColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(article.authorProfileUrl)))),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        comment.userName,
                        style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        comment.createdAt.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 12,
                        ),
                      ),
                      Text(comment.text,
                          // softWrap: false,
                          maxLines: 3,
                          overflow: TextOverflow.visible,
                          style: Styles.bodyTextStyle),
                    ],
                  ),
                ),
              ],
            ),
            trailing: editDelete(comment),
          ),
        ),
      ),
    );
  }

  return Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Center(
          child: Text(
        "Article Detail",
        style: Styles.drawerTileStyle.copyWith(color: Colors.black),
      )),
    ),
    body: SingleChildScrollView(
      child: Container(
        // padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(article.authorProfileUrl),
                    radius: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("$username",
                            style: Styles.bodyTextStyle
                                .copyWith(fontWeight: FontWeight.bold)),
                        Text("$postedDate"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.more_vert,
                        size: 24.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              // alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Text(
                    "#Tech",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "#Business",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
            FittedBox(
              child: Image(image: NetworkImage(image)),
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 30.0, 10.0, 10.0),
              child: DropCapText(
                content,
                dropCapPosition: DropCapPosition.start,

                // mode: DropCapMode.inside,
                style: Styles.bodyTextStyle,
              ),
            ),
            Center(
              child: Row(
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(50, 8, 8, 8),
                      child: Column(
                        children: [
                          Center(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: '4.5/',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: '5',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Text(
                            "Rate This Article",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.1,
              color: Colors.black,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(12.0, 5.0, 8.0, 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "16 comments",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        )),
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "comments",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: BlocBuilder<CommentBloc, CommentState>(
                builder: (_, state) {
                  if (state is CommentOperationFailure) {
                    return Text('Could not do course operation');
                  }

                  if (state is CommentLoadSuccess) {
                    final comments = state.comments;

                    return Column(
                        children: comments.map((c) {
                      return CommentCard(c);
                    }).toList());
                  }

                  return CircularProgressIndicator();
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Card(
              elevation: 3.0,
              margin: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 10.0),
                child: TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    suffixIcon: Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 3.0),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Align(
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Icon(Icons.send),
                          color: Colors.white,
                          onPressed: () {
                            Comment c = Comment(
                                user: article.authorUserId,
                                updatedAt: DateTime.now(),
                                createdAt: DateTime.now(),
                                text: myController.text,
                                id: "");
                            BlocProvider.of<CommentBloc>(context)
                                .add(CreateComment(c));
                            myController.clear();
                          },
                        ),
                      ),
                    ),
                    // border: OutlineInputBorder(),
                    hintText: 'Write a comment',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildLoading() => Center(
      child: CircularProgressIndicator(),
    );

Widget _buildError(BuildContext context, String msg) => Container(
      child: Scaffold(
        body: Center(
          child: Text(
            msg,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w600, color: Colors.red),
          ),
        ),
      ),
    );

PopupMenuItem _buildPopupMenuItem(
    String title, IconData iconData, BuildContext context, Comment comment) {
  return PopupMenuItem(
    child: GestureDetector(
      onTap: () {
        if (title == "Edit") {
          BlocProvider.of<CommentBloc>(context).add(EditComment(comment));
        } else if (title == "Delete") {
          BlocProvider.of<CommentBloc>(context).add(DeleteComment(comment));
        }
      },
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.black,
          ),
          Text(title),
        ],
      ),
    ),
  );
}

Widget editDelete(Comment comment) {
  // print("one");
  return PopupMenuButton(itemBuilder: (context) {
    return [
      _buildPopupMenuItem('Edit', Icons.edit, context, comment),
      _buildPopupMenuItem('Delete', Icons.delete, context, comment),
    ];
  });
}

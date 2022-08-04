import '../../auth/domain/entities/user.dart';
import '../models/comment.dart';

class MockComment {
  List<Comment> comments = <Comment>[
    Comment(
      id: "1",
      createdAt: DateTime.now(),
      user: User(id: "", email: "", profileId: ""),
      text:
          'I think Facebook or Meta should  reconsider its marketing strategy.',
      updatedAt: DateTime.now(),
    ),
    Comment(
      id: "2",
      createdAt: DateTime.now(),
      user: User(id: "", email: "", profileId: ""),
      text:
          '''Since executives disclosed the fall in February, the firm\'s share price has nearly halved.But hope things turnout fine.''',
      updatedAt: DateTime.now(),
    ),
    Comment(
      id: "3",
      createdAt: DateTime.now(),
      user: User(id: "", email: "", profileId: ""),
      text: 'Oh, They always know how to make a comeback\:\)',
      updatedAt: DateTime.now(),
    )
  ];
}

//
// var username = "Adrian Smith";
// var postedDate = "Dec 10, 2022";
// var article =
//     "The number of daily active Facebook users grew to 1.96 billion. That marked a turnaround from last year, when the social network reported a decline in users for the first time.\n\nThe drop wiped billions from the firm's market value.\n\nSince executives disclosed the fall in February, the firm's share price has nearly halved. But shares jumped 19% in after-hours trade on Wednesday.";
//
// var currSelectedArticle = Article(
//     author: username,
//     title: "The number of daily active Facebook users grew to 1.96 billion.",
//     description: "description",
//     url: "url",
//     urlToImage: "urlToImage",
//     publishedAt: postedDate,
//     content: article);
